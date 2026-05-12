# Base R practice: RHC real-world study / propensity score workflow
# Data source: G:/第二期统计学/10真实世界/rhc.csv

data_path <- "G:/第二期统计学/10真实世界/rhc.csv"
out_dir <- "outputs"
dir.create(out_dir, showWarnings = FALSE, recursive = TRUE)

rhc <- read.csv(data_path, stringsAsFactors = FALSE)

rhc$treat <- ifelse(rhc$swang1 == "RHC", 1L, 0L)
rhc$death_bin <- ifelse(rhc$death == "Yes", 1L, 0L)

covariates <- c(
  "age", "sex", "race", "edu", "income", "ninsclas", "cat1", "das2d3pc",
  "dnr1", "ca", "surv2md1", "aps1", "scoma1", "wtkilo1", "temp1",
  "meanbp1", "resp1", "hrt1", "pafi1", "paco21", "ph1", "wblc1", "hema1",
  "sod1", "pot1", "crea1", "bili1", "alb1", "resp", "card", "neuro",
  "gastr", "renal", "meta", "hema", "seps", "trauma", "ortho", "cardiohx",
  "chfhx", "dementhx", "psychhx", "chrpulhx", "renalhx", "liverhx",
  "gibledhx", "malighx", "immunhx", "transhx", "amihx"
)

cat_vars <- c(
  "sex", "race", "income", "ninsclas", "cat1", "dnr1", "ca", "resp",
  "card", "neuro", "gastr", "renal", "meta", "hema", "seps", "trauma",
  "ortho"
)

needed <- c("treat", "death_bin", covariates)
dat <- rhc[complete.cases(rhc[, needed]), needed]

for (v in intersect(cat_vars, names(dat))) {
  dat[[v]] <- factor(dat[[v]])
}

wald_or <- function(fit, term = "treat") {
  coefs <- coef(summary(fit))
  beta <- coefs[term, "Estimate"]
  se <- coefs[term, "Std. Error"]
  data.frame(
    OR = exp(beta),
    CI_lower = exp(beta - 1.96 * se),
    CI_upper = exp(beta + 1.96 * se),
    p_value = coefs[term, "Pr(>|z|)"],
    row.names = NULL
  )
}

auc_rank <- function(y, score) {
  y <- as.integer(y)
  r <- rank(score, ties.method = "average")
  n1 <- sum(y == 1L)
  n0 <- sum(y == 0L)
  (sum(r[y == 1L]) - n1 * (n1 + 1) / 2) / (n1 * n0)
}

smd_numeric <- function(x, g) {
  xt <- x[g == 1L]
  xc <- x[g == 0L]
  pooled <- sqrt((var(xt) + var(xc)) / 2)
  if (is.na(pooled) || pooled == 0) return(NA_real_)
  (mean(xt) - mean(xc)) / pooled
}

smd_long <- function(data, vars, group_var = "treat") {
  out <- list()
  k <- 1L
  g <- data[[group_var]]
  for (v in vars) {
    x <- data[[v]]
    if (is.factor(x) || is.character(x)) {
      xf <- factor(x)
      for (lev in levels(xf)) {
        out[[k]] <- data.frame(
          variable = v,
          level = lev,
          smd = smd_numeric(as.integer(xf == lev), g)
        )
        k <- k + 1L
      }
    } else {
      out[[k]] <- data.frame(variable = v, level = "", smd = smd_numeric(x, g))
      k <- k + 1L
    }
  }
  do.call(rbind, out)
}

crude_all <- glm(death_bin ~ treat, family = binomial(), data = rhc)
crude_cc <- glm(death_bin ~ treat, family = binomial(), data = dat)

ps_formula <- reformulate(covariates, response = "treat")
ps_fit <- glm(ps_formula, family = binomial(), data = dat)
dat$ps <- pmin(pmax(fitted(ps_fit), .Machine$double.eps), 1 - .Machine$double.eps)
dat$logit_ps <- qlogis(dat$ps)

ps_adj <- glm(death_bin ~ treat + ps, family = binomial(), data = dat)
ps_auc <- auc_rank(dat$treat, dat$ps)

set.seed(1234)
treated_idx <- which(dat$treat == 1L)
control_idx <- which(dat$treat == 0L)
available_controls <- control_idx
treated_order <- sample(treated_idx)
caliper <- 0.2 * sd(dat$logit_ps)

pairs <- data.frame(treated = integer(), control = integer(), distance = double())
for (i in treated_order) {
  if (length(available_controls) == 0L) break
  d <- abs(dat$logit_ps[available_controls] - dat$logit_ps[i])
  best <- which.min(d)
  if (length(best) == 1L && is.finite(d[best]) && d[best] <= caliper) {
    pairs[nrow(pairs) + 1L, ] <- c(i, available_controls[best], d[best])
    available_controls <- available_controls[-best]
  }
}

matched <- rbind(
  cbind(pair_id = seq_len(nrow(pairs)), dat[pairs$treated, ]),
  cbind(pair_id = seq_len(nrow(pairs)), dat[pairs$control, ])
)
matched$treat <- as.integer(matched$treat)
matched$death_bin <- as.integer(matched$death_bin)

matched_fit <- glm(death_bin ~ treat, family = binomial(), data = matched)

balance_before <- smd_long(dat, covariates)
balance_after <- smd_long(matched, covariates)
names(balance_before)[3] <- "smd_before"
names(balance_after)[3] <- "smd_after"
balance <- merge(balance_before, balance_after, by = c("variable", "level"), all = TRUE)
balance$abs_smd_before <- abs(balance$smd_before)
balance$abs_smd_after <- abs(balance$smd_after)

summary_rows <- rbind(
  cbind(method = "Crude logistic, all rows", estimand = "Association", n = nrow(rhc), wald_or(crude_all)),
  cbind(method = "Crude logistic, complete-case", estimand = "Association", n = nrow(dat), wald_or(crude_cc)),
  cbind(method = "PS-adjusted logistic", estimand = "ATE approximation", n = nrow(dat), wald_or(ps_adj)),
  cbind(method = "Nearest matching, base R", estimand = "ATT approximation", n = nrow(matched), wald_or(matched_fit))
)

death_rates <- aggregate(
  death_bin ~ treat,
  data = matched,
  FUN = function(x) c(n = length(x), deaths = sum(x), death_rate = mean(x))
)
death_rates <- data.frame(
  treat = ifelse(death_rates$treat == 1L, "RHC", "No RHC"),
  n = death_rates$death_bin[, "n"],
  deaths = death_rates$death_bin[, "deaths"],
  death_rate = death_rates$death_bin[, "death_rate"]
)

diagnostics <- data.frame(
  item = c(
    "source_rows", "complete_case_rows", "treated_complete_case",
    "control_complete_case", "ps_auc", "caliper_logit_ps",
    "matched_pairs", "max_abs_smd_before", "max_abs_smd_after",
    "n_abs_smd_gt_0.1_before", "n_abs_smd_gt_0.1_after"
  ),
  value = c(
    nrow(rhc), nrow(dat), sum(dat$treat == 1L), sum(dat$treat == 0L),
    ps_auc, caliper, nrow(pairs), max(balance$abs_smd_before, na.rm = TRUE),
    max(balance$abs_smd_after, na.rm = TRUE),
    sum(balance$abs_smd_before > 0.1, na.rm = TRUE),
    sum(balance$abs_smd_after > 0.1, na.rm = TRUE)
  )
)

write.csv(summary_rows, file.path(out_dir, "rhc_base_psm_effect_summary.csv"), row.names = FALSE)
write.csv(balance, file.path(out_dir, "rhc_base_psm_balance_smd.csv"), row.names = FALSE)
write.csv(death_rates, file.path(out_dir, "rhc_base_psm_matched_death_rates.csv"), row.names = FALSE)
write.csv(diagnostics, file.path(out_dir, "rhc_base_psm_diagnostics.csv"), row.names = FALSE)

cat("RHC base-R PSM practice finished.\n")
cat("Rows:", nrow(rhc), " complete-case rows:", nrow(dat), "\n")
cat("PS AUC:", round(ps_auc, 3), "\n")
cat("Matched pairs:", nrow(pairs), "\n")
cat("Max |SMD| before:", round(max(balance$abs_smd_before, na.rm = TRUE), 3), "\n")
cat("Max |SMD| after:", round(max(balance$abs_smd_after, na.rm = TRUE), 3), "\n")
cat("Outputs written to:", normalizePath(out_dir), "\n")
