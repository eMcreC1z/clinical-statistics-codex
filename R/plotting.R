# Plotting helpers. Functions use ggplot2 when available.

plot_missingness <- function(data) {
  profile <- missingness_profile(data)
  if (requireNamespace("ggplot2", quietly = TRUE)) {
    ggplot2::ggplot(profile, ggplot2::aes(x = stats::reorder(variable, pct_missing), y = pct_missing)) +
      ggplot2::geom_col() +
      ggplot2::coord_flip() +
      ggplot2::labs(x = NULL, y = "Missing (%)")
  } else {
    graphics::barplot(profile$pct_missing, names.arg = profile$variable, las = 2, ylab = "Missing (%)")
  }
}

plot_forest <- function(model_table, estimate = "estimate", low = "conf_low", high = "conf_high", term = "term") {
  assert_columns(model_table, c(estimate, low, high, term))
  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop("Package 'ggplot2' is required for plot_forest.", call. = FALSE)
  }
  ggplot2::ggplot(model_table, ggplot2::aes(x = .data[[estimate]], y = stats::reorder(.data[[term]], .data[[estimate]]))) +
    ggplot2::geom_vline(xintercept = 1, linetype = 2, color = "gray50") +
    ggplot2::geom_errorbarh(ggplot2::aes(xmin = .data[[low]], xmax = .data[[high]]), height = 0.2) +
    ggplot2::geom_point() +
    ggplot2::labs(x = "Estimate", y = NULL)
}
