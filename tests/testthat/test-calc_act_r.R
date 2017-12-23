context("calc_act_r")

test_that("use", {

  act <- calc_act_r(
    trace = sin(seq(from = 0.0, to = 2.0 * pi, length.out = 100)),
    sample_interval = 1
  )
  testthat::expect_equal(object = act, expected = 38.18202, tolerance = 0.01)
})

test_that("abuse", {

  testthat::expect_error(
    calc_act_r(trace = "not numeric", sample_interval = 1),
    "trace must be numeric"
  )

  testthat::expect_error(
    calc_act_r(trace = seq(1, 10), sample_interval = 0),
    "sample interval must be at least one"
  )

})
