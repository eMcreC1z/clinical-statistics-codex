# Propensity score helpers for observational comparisons.

estimate_propensity <- function(data, treatment, covariates) {
  assert_columns(data, c(treatment, covariates))
  form <- build_formula(treatment, covariates)
  fit <- stats::glm(form, data = data, family = stats::binomial())
  ps <- stats::predict(fit, type = "response")
  list(fit = fit, propensity_score = ps)
}

compute_iptw <- function(treatment, propensity_score, estimand = c("ATE", "ATT")) {
  estimand <- match.arg(estimand)
  trt <- as.numeric(treatment)
  if (!all(trt %in% c(0, 1), na.rm = TRUE)) {
    stop("treatment must be coded 0/1.", call. = FALSE)
  }
  ps <- pmin(pmax(propensity_score, 1e-6), 1 - 1e-6)
  if (estimand == "ATE") {
    ifelse(trt == 1, 1 / ps, 1 / (1 - ps))
  } else {
    ifelse(trt == 1, 1, ps / (1 - ps))
  }
}

standardized_mean_difference <- function(x, treatment, weights = NULL) {
  trt <- as.numeric(treatment)
  if (is.null(weights)) {
    weights <- rep(1, length(trt))
  }
  if (is.numeric(x)) {
    m1 <- stats::weighted.mean(x[trt == 1], weights[trt == 1], na.rm = TRUE)
    m0 <- stats::weighted.mean(x[trt == 0], weights[trt == 0], na.rm = TRUE)
    v1 <- stats::var(x[trt == 1], na.rm = TRUE)
    v0 <- stats::var(x[trt == 0], na.rm = TRUE)
    (m1 - m0) / sqrt((v1 + v0) / 2)
  } else {
    lev <- sort(unique(x[!is.na(x)]))[1]
    standardized_mean_difference(as.numeric(x == lev), treatment, weights)
  }
}

balance_table <- function(data, treatment, covariates, weights = NULL) {
  assert_columns(data, c(treatment, covariates))
  data.frame(
    variable = covariates,
    smd = vapply(covariates, function(v) standardized_mean_difference(data[[v]], data[[treatment]], weights), numeric(1)),
    row.names = NULL
  )
}

propensity_score_pipeline <- function(data, treatment, covariates, estimand = "ATE") {
  ps <- estimate_propensity(data, treatment, covariates)
  weights <- compute_iptw(data[[treatment]], ps$propensity_score, estimand = estimand)
  list(
    fit = ps$fit,
    propensity_score = ps$propensity_score,
    weights = weights,
    balance = balance_table(data, treatment, covariates, weights = weights)
  )
}
