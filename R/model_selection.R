# Lightweight model selection helpers.

build_formula <- function(outcome, predictors) {
  if (length(predictors) == 0) {
    stats::as.formula(paste(outcome, "~ 1"))
  } else {
    stats::as.formula(paste(outcome, "~", paste(predictors, collapse = " + ")))
  }
}

is_binary_vector <- function(x) {
  ux <- unique(x[!is.na(x)])
  length(ux) == 2
}

is_count_vector <- function(x) {
  is.numeric(x) && all(x[!is.na(x)] >= 0) && all(x[!is.na(x)] == floor(x[!is.na(x)]))
}

choose_regression_family <- function(data, outcome) {
  assert_columns(data, outcome)
  y <- data[[outcome]]
  if (is_binary_vector(y)) {
    return(stats::binomial())
  }
  if (is_count_vector(y) && length(unique(y[!is.na(y)])) > 5) {
    return(stats::poisson())
  }
  if (is.numeric(y)) {
    return(stats::gaussian())
  }
  stop("Cannot choose a default regression family for outcome: ", outcome, call. = FALSE)
}
