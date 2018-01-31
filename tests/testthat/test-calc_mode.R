context("calc_mode")

test_that("use", {

  testthat::expect_equal(calc_mode(c(1,2,3,3)), 3)

})
