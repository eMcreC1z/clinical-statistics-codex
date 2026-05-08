# Report rendering helpers.

render_quarto <- function(input, output_dir = NULL, execute = TRUE) {
  if (!requireNamespace("quarto", quietly = TRUE)) {
    stop("Package 'quarto' is required. Install it with install.packages('quarto').", call. = FALSE)
  }
  if (!file.exists(input)) {
    stop("Input file does not exist: ", input, call. = FALSE)
  }
  quarto::quarto_render(input = input, output_dir = output_dir, execute = execute)
}

render_template <- function(template, output, replacements = list()) {
  if (!file.exists(template)) {
    stop("Template file does not exist: ", template, call. = FALSE)
  }
  text <- readLines(template, warn = FALSE)
  for (key in names(replacements)) {
    text <- gsub(paste0("\\[", key, "\\]"), replacements[[key]], text, fixed = FALSE)
  }
  writeLines(text, output)
  output
}
