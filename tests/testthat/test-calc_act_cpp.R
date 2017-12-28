context("calc_act_cpp")

test_that("use", {

  testthat::expect_error(
    beastier:::calc_act_cpp(sample = seq(1, 10), sample_interval = 0),
    "sample interval must be at least one"
  )

})
