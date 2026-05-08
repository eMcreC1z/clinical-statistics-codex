source("../../R/data_check.R")

test_that("missingness_profile summarizes columns", {
  dat <- data.frame(a = c(1, NA, 3), b = c("x", "y", NA))
  prof <- missingness_profile(dat)
  expect_equal(nrow(prof), 2)
  expect_equal(prof$n_missing[prof$variable == "a"], 1)
})

test_that("assert_columns fails on missing variables", {
  dat <- data.frame(a = 1)
  expect_error(assert_columns(dat, c("a", "b")), "Missing required columns")
})
