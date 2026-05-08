# Table 1 summary helpers.

format_n_pct <- function(n, denom, digits = 1) {
  pct <- if (denom == 0) NA_real_ else n / denom * 100
  paste0(n, " (", format(round(pct, digits), nsmall = digits), "%)")
}

summarize_continuous <- function(x, digits = 1) {
  x <- x[!is.na(x)]
  if (length(x) == 0) {
    return("NA")
  }
  mean_sd <- paste0(round(mean(x), digits), " (", round(stats::sd(x), digits), ")")
  med_iqr <- paste0(round(stats::median(x), digits), " [", round(stats::quantile(x, 0.25), digits), ", ", round(stats::quantile(x, 0.75), digits), "]")
  paste0(mean_sd, "; ", med_iqr)
}

summarize_categorical <- function(x, digits = 1) {
  non_missing <- x[!is.na(x)]
  tab <- sort(table(non_missing), decreasing = TRUE)
  if (length(tab) == 0) {
    return("NA")
  }
  paste(paste0(names(tab), ": ", mapply(format_n_pct, as.integer(tab), length(non_missing), MoreArgs = list(digits = digits))), collapse = "; ")
}

summarize_variable <- function(x, digits = 1) {
  if (is.numeric(x) || is.integer(x)) {
    summarize_continuous(x, digits = digits)
  } else {
    summarize_categorical(x, digits = digits)
  }
}

table1 <- function(data, vars, strata = NULL, digits = 1) {
  assert_columns(data, vars)
  if (!is.null(strata)) {
    assert_columns(data, strata)
    groups <- sort(unique(data[[strata]][!is.na(data[[strata]])]))
    rows <- lapply(vars, function(var) {
      values <- lapply(groups, function(g) summarize_variable(data[data[[strata]] == g & !is.na(data[[strata]]), var], digits = digits))
      names(values) <- paste0(strata, "=", groups)
      data.frame(
        variable = var,
        overall = summarize_variable(data[[var]], digits = digits),
        as.data.frame(values, check.names = FALSE),
        missing = sum(is.na(data[[var]])),
        row.names = NULL
      )
    })
  } else {
    rows <- lapply(vars, function(var) {
      data.frame(
        variable = var,
        overall = summarize_variable(data[[var]], digits = digits),
        missing = sum(is.na(data[[var]])),
        row.names = NULL
      )
    })
  }
  do.call(rbind, rows)
}
