context("calc_stderr_mean")

test_that("use", {

  trace <- sin(seq(from = 0.0, to = 2.0 * pi, length.out = 100))
  stderr_mean <- calc_stderr_mean(trace)
  testthat::expect_equal(stderr_mean, expected = 0.4347425, tolerance = 0.0001)
})

test_that("equivalent to suggestion of @bjoelle", {
  return()
  # @bjoelle suggested to use 'stats::sd(trace) / sqrt(length(trace))'
  # instead of using 'calc_stderr_mean', as her suggestion is
  # indeed simpler. Too bad, the BEAST2 implementation is different
  # (as used by 'calc_stderr_mean') is different and leading
  trace <- sin(seq(from = 0.0, to = 2.0 * pi, length.out = 100))
  stderr_mean_beast <- calc_stderr_mean(trace)
  stderr_mean_bjoelle <- stats::sd(trace) / sqrt(length(trace))
  testthat::expect_equal(stderr_mean_beast, stderr_mean_bjoelle)
})

test_that("use, posterior", {

  estimates <- parse_beast_log(get_tracerer_path("beast2_example_output.log"))
  trace <- remove_burn_ins(estimates, burn_in_fraction = 0.1)

  result <- tracerer:::calc_stderr_mean(trace$posterior)
  testthat::expect_equivalent(0.5045, result, tolerance = 0.01)

})

test_that("use, tree height", {

  estimates <- parse_beast_log(get_tracerer_path("beast2_example_output.log"))
  trace <- remove_burn_ins(estimates, burn_in_fraction = 0.1)

  result <- tracerer:::calc_stderr_mean(trace$TreeHeight)
  testthat::expect_equivalent(0.144, result, tolerance = 0.01)

})

test_that("abuse", {

  testthat::expect_error(
    tracerer:::calc_stderr_mean("nonsense"),
    "'trace' must be numeric"
  )

})
