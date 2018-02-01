context("calc_std_error_of_mean_cpp")

test_that("use", {

  testthat::expect_error(
    tracerer:::calc_std_error_of_mean_cpp(
      sample = seq(1, 10), sample_interval = 0),
    "sample interval must be at least one"
  )

})
