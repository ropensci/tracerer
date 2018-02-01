context("calc_stderr_mean")

test_that("use", {

  trace <- sin(seq(from = 0.0, to = 2.0 * pi, length.out = 100))
  stderr_mean <- calc_stderr_mean(
    trace = trace,
    sample_interval = 1
  )
  testthat::expect_equal(stderr_mean, expected = 0.4347425, tolerance = 0.0001)
})

test_that("use, posterior", {

  estimates <- parse_beast_log(get_path("beast2_example_output.log"))
  trace <- remove_burn_ins(estimates, burn_in_fraction = 0.1)

  result <- tracerer:::calc_stderr_mean(trace$posterior, sample_interval = 1000)
  testthat::expect_equivalent(0.5045, result, tolerance = 0.01)

})

test_that("use, tree height", {

  estimates <- parse_beast_log(get_path("beast2_example_output.log"))
  trace <- remove_burn_ins(estimates, burn_in_fraction = 0.1)

  result <- tracerer:::calc_stderr_mean(trace$TreeHeight, sample_interval = 1000)
  testthat::expect_equivalent(0.144, result, tolerance = 0.01)

})
