context("calc_act")

test_that("use", {

  act <- tracerer::calc_act(
    trace = sin(seq(from = 0.0, to = 2.0 * pi, length.out = 100)),
    sample_interval = 1
  )
  testthat::expect_equal(object = act, expected = 38.18202, tolerance = 0.01)
})

test_that("use, posterior", {

  estimates <- parse_beast_log(get_tracerer_path("beast2_example_output.log"))
  trace <- remove_burn_ins(estimates, burn_in_fraction = 0.1)

  result <- tracerer:::calc_act(trace$posterior, sample_interval = 1000)
  testthat::expect_equivalent(1000, result, tolerance = 0.01)

})

test_that("use, tree height", {

  estimates <- parse_beast_log(get_tracerer_path("beast2_example_output.log"))
  trace <- remove_burn_ins(estimates, burn_in_fraction = 0.1)

  result <- tracerer:::calc_act(trace$TreeHeight, sample_interval = 1000)
  testthat::expect_equivalent(1502.1208, result, tolerance = 0.01)

})


test_that("abuse", {

  testthat::expect_error(
    calc_act(trace = "not numeric", sample_interval = 1),
    "trace must be numeric"
  )

  testthat::expect_error(
    calc_act(trace = seq(1, 10), sample_interval = 0),
    "sample interval must be at least one"
  )

})
