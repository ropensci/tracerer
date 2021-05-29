test_that("exanple usage", {

  tracelog_filename <- get_tracerer_path("beast2_example_output.log")

  # Parse the file as-is and conclude the sampling interval
  df <- parse_beast_tracelog_file(
    tracelog_filename = tracelog_filename
  )
  sample_interval <- df$Sample[2] - df$Sample[1] # nolint use uppercase variable name just like BEAST2

  # Only keep the parameter estimates,
  # do not care about the sampling times anymore
  estimates <- subset(df, select = -Sample) # nolint use uppercase variable name just like BEAST2

  esses <- rep(NA, ncol(estimates))
  burn_in_fraction <- 0.1
  for (i in seq_along(estimates)) {
    # Trace with the burn-in still present
    trace_raw <- as.numeric(t(estimates[i]))

    # Trace with the burn-in removed
    trace <- tracerer::remove_burn_in(trace = trace_raw, burn_in_fraction = 0.1)

    # Store the effectice sample size
    esses[i] <- tracerer::calc_ess(trace, sample_interval = sample_interval)
  }

  # Use the values that TRACER shows
  expected_esses <- c(10, 10, 10, 10, 7, 10, 9, 6)
  testthat::expect_true(all(expected_esses - esses < 0.5))
})

test_that("use, posterior", {

  estimates <- parse_beast_tracelog_file(
    get_tracerer_path("beast2_example_output.log")
  )
  trace <- remove_burn_ins(estimates, burn_in_fraction = 0.1)

  result <- calc_ess(trace$posterior, sample_interval = 1000)
  expect_equivalent(10, result, tolerance = 0.01)

})

test_that("use, tree height", {

  estimates <- parse_beast_tracelog_file(
    get_tracerer_path("beast2_example_output.log")
  )
  trace <- remove_burn_ins(estimates, burn_in_fraction = 0.1)

  result <- tracerer:::calc_ess(trace$TreeHeight, sample_interval = 1000)
  testthat::expect_equivalent(6.6573, result, tolerance = 0.01)

})

test_that("calc_ess: abuse", {

  expect_error(
    calc_ess(trace = "not numeric", sample_interval = 1),
    "'trace' must be numeric"
  )

  expect_error(
    calc_ess(trace = seq(1, 10), sample_interval = 0),
    "sample interval must be at least one"
  )

})
