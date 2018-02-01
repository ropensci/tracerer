context("calc_mode")

test_that("use", {

  testthat::expect_equal(tracerer:::calc_mode(c(1, 2, 2)), 2)
  testthat::expect_equal(tracerer:::calc_mode(c(1, 1, 2)), 1)

  # For a uniform distribution, return NA
  testthat::expect_true(is.na(tracerer:::calc_mode(values = c(5, 5, 6, 6))))
  testthat::expect_true(is.na(tracerer:::calc_mode(c(2, 1))))
})
