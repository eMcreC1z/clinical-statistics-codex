# Regression pipeline utilities.

run_regression <- function(data, outcome, predictors, family = NULL) {
  assert_columns(data, c(outcome, predictors))
  form <- build_formula(outcome, predictors)
  if (is.null(family)) {
    family <- choose_regression_family(data, outcome)
  }
  stats::glm(form, data = data, family = family)
}

extract_model_table <- function(fit, exponentiate = NULL) {
  sm <- summary(fit)
  coefs <- as.data.frame(sm$coefficients)
  coefs$term <- rownames(coefs)
  rownames(coefs) <- NULL

  estimate_col <- grep("Estimate", names(coefs), value = TRUE)[1]
  se_col <- grep("Std. Error", names(coefs), value = TRUE)[1]
  z_col <- grep("z value|t value", names(coefs), value = TRUE)[1]
  p_col <- grep("Pr\\(", names(coefs), value = TRUE)[1]

  if (is.null(exponentiate)) {
    exponentiate <- inherits(fit, "glm") && fit$family$family %in% c("binomial", "poisson")
  }

  estimate <- coefs[[estimate_col]]
  se <- coefs[[se_col]]
  low <- estimate - stats::qnorm(0.975) * se
  high <- estimate + stats::qnorm(0.975) * se

  if (exponentiate) {
    estimate <- exp(estimate)
    low <- exp(low)
    high <- exp(high)
  }

  data.frame(
    term = coefs$term,
    estimate = estimate,
    conf_low = low,
    conf_high = high,
    statistic = coefs[[z_col]],
    p_value = coefs[[p_col]],
    row.names = NULL
  )
}

regression_pipeline <- function(data, outcome, predictors, family = NULL) {
  fit <- run_regression(data, outcome, predictors, family = family)
  list(
    fit = fit,
    table = extract_model_table(fit),
    n = stats::nobs(fit),
    family = fit$family$family
  )
}
