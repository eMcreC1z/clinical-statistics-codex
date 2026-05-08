# Missing data utilities.

complete_case_data <- function(data, vars) {
  assert_columns(data, vars)
  data[stats::complete.cases(data[, vars, drop = FALSE]), , drop = FALSE]
}

simple_impute <- function(data, vars = names(data), numeric_method = c("median", "mean"), categorical_value = "Missing") {
  numeric_method <- match.arg(numeric_method)
  assert_columns(data, vars)
  out <- data
  for (var in vars) {
    x <- out[[var]]
    if (is.numeric(x)) {
      fill <- if (numeric_method == "median") stats::median(x, na.rm = TRUE) else mean(x, na.rm = TRUE)
      x[is.na(x)] <- fill
      out[[var]] <- x
    } else {
      x <- as.character(x)
      x[is.na(x)] <- categorical_value
      out[[var]] <- factor(x)
    }
  }
  out
}

missing_data_pipeline <- function(data, analysis_vars) {
  assert_columns(data, analysis_vars)
  list(
    profile = missingness_profile(data[, analysis_vars, drop = FALSE]),
    complete_case = complete_case_data(data, analysis_vars),
    simple_imputed_median = simple_impute(data, analysis_vars, numeric_method = "median")
  )
}
