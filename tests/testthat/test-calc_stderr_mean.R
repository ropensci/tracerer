context("calc_stderr_mean")

test_that("use", {

  trace <- sin(seq(from = 0.0, to = 2.0 * pi, length.out = 100))
  stderr_mean <- calc_stderr_mean(
    trace = trace,
    sample_interval = 1
  )
  testthat::expect_equal(stderr_mean, expected = 0.4347425, tolerance = 0.0001)
})
