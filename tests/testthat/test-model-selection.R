source("../../R/data_check.R")
source("../../R/model_selection.R")

test_that("choose_regression_family chooses binomial for binary outcome", {
  dat <- data.frame(y = c(0, 1, 0, 1), x = 1:4)
  fam <- choose_regression_family(dat, "y")
  expect_equal(fam$family, "binomial")
})

test_that("build_formula includes predictors", {
  form <- build_formula("y", c("x1", "x2"))
  expect_equal(as.character(form), c("~", "y", "x1 + x2"))
})
