context("calc_mode")

test_that("use", {

  testthat::expect_equal(tracerer:::calc_mode(c(1, 2, 2)), 2)
  testthat::expect_equal(tracerer:::calc_mode(c(1, 1, 2)), 1)

  # For a uniform distribution, take the first
  testthat::expect_equal(tracerer:::calc_mode(c(1, 2)), 1)
  testthat::expect_equal(tracerer:::calc_mode(c(2, 1)), 2)
})
