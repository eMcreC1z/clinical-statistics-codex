# Survival analysis pipeline utilities.

require_survival <- function() {
  if (!requireNamespace("survival", quietly = TRUE)) {
    stop("Package 'survival' is required for survival analysis.", call. = FALSE)
  }
  invisible(TRUE)
}

survival_formula <- function(time, event, predictors = character()) {
  rhs <- if (length(predictors) == 0) "1" else paste(predictors, collapse = " + ")
  stats::as.formula(paste0("survival::Surv(", time, ", ", event, ") ~ ", rhs))
}

run_cox_model <- function(data, time, event, predictors) {
  require_survival()
  assert_columns(data, c(time, event, predictors))
  survival::coxph(survival_formula(time, event, predictors), data = data)
}

run_kaplan_meier <- function(data, time, event, group = NULL) {
  require_survival()
  assert_columns(data, c(time, event, group))
  rhs <- if (is.null(group)) "1" else group
  form <- stats::as.formula(paste0("survival::Surv(", time, ", ", event, ") ~ ", rhs))
  survival::survfit(form, data = data)
}

event_summary <- function(data, time, event, group = NULL) {
  assert_columns(data, c(time, event, group))
  if (is.null(group)) {
    data.frame(
      group = "overall",
      n = nrow(data),
      events = sum(data[[event]] == 1, na.rm = TRUE),
      censored = sum(data[[event]] == 0, na.rm = TRUE),
      median_time = stats::median(data[[time]], na.rm = TRUE),
      row.names = NULL
    )
  } else {
    do.call(rbind, lapply(sort(unique(data[[group]][!is.na(data[[group]])])), function(g) {
      d <- data[data[[group]] == g & !is.na(data[[group]]), ]
      data.frame(
        group = as.character(g),
        n = nrow(d),
        events = sum(d[[event]] == 1, na.rm = TRUE),
        censored = sum(d[[event]] == 0, na.rm = TRUE),
        median_time = stats::median(d[[time]], na.rm = TRUE),
        row.names = NULL
      )
    }))
  }
}
