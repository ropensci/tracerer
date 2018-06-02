context("calc_std_error_of_mean_cpp")

test_that("use", {

  testthat::expect_silent(
    tracerer:::calc_std_error_of_mean_cpp(
      sample = seq(1, 10)
    )
  )

})
