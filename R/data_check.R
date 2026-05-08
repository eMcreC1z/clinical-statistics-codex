# Data validation helpers for clinical analysis datasets.

assert_columns <- function(data, columns) {
  missing <- setdiff(columns, names(data))
  if (length(missing) > 0) {
    stop("Missing required columns: ", paste(missing, collapse = ", "), call. = FALSE)
  }
  invisible(TRUE)
}

missingness_profile <- function(data) {
  n <- nrow(data)
  data.frame(
    variable = names(data),
    class = vapply(data, function(x) paste(class(x), collapse = "/"), character(1)),
    n_missing = vapply(data, function(x) sum(is.na(x)), integer(1)),
    pct_missing = if (n == 0) NA_real_ else round(vapply(data, function(x) mean(is.na(x)) * 100, numeric(1)), 1),
    n_unique = vapply(data, function(x) length(unique(x[!is.na(x)])), integer(1)),
    row.names = NULL
  )
}

range_check <- function(data, ranges) {
  if (!is.list(ranges)) {
    stop("ranges must be a named list of c(min, max) numeric vectors.", call. = FALSE)
  }
  out <- lapply(names(ranges), function(var) {
    assert_columns(data, var)
    bounds <- ranges[[var]]
    if (length(bounds) != 2) {
      stop("Range for ", var, " must have length 2.", call. = FALSE)
    }
    x <- data[[var]]
    bad <- !is.na(x) & (x < bounds[1] | x > bounds[2])
    data.frame(
      variable = var,
      min_allowed = bounds[1],
      max_allowed = bounds[2],
      n_out_of_range = sum(bad),
      row.names = NULL
    )
  })
  do.call(rbind, out)
}

duplicate_id_check <- function(data, id) {
  assert_columns(data, id)
  ids <- data[[id]]
  data.frame(
    id = id,
    n_rows = length(ids),
    n_unique = length(unique(ids[!is.na(ids)])),
    n_missing = sum(is.na(ids)),
    n_duplicate_rows = sum(duplicated(ids) & !is.na(ids)),
    row.names = NULL
  )
}

data_check <- function(data, required = character(), ranges = list(), id = NULL) {
  if (!is.data.frame(data)) {
    stop("data must be a data.frame.", call. = FALSE)
  }
  if (length(required) > 0) {
    assert_columns(data, required)
  }

  list(
    dimensions = data.frame(n_rows = nrow(data), n_columns = ncol(data)),
    missingness = missingness_profile(data),
    ranges = if (length(ranges) > 0) range_check(data, ranges) else NULL,
    duplicates = if (!is.null(id)) duplicate_id_check(data, id) else NULL
  )
}
