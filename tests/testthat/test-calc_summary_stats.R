test_that("use, single trace", {

  estimates_all <- parse_beast_log(
    get_tracerer_path("beast2_example_output.log")
  )
  estimates <- remove_burn_ins(estimates_all, burn_in_fraction = 0.1)
  sum_stats <- calc_summary_stats(
    traces = estimates$posterior,
    sample_interval = 1000
  )
  expect_true("mean" %in% names(sum_stats))
  expect_equivalent(sum_stats$mean, -70.5839, tolerance = 0.00001)
  expect_true("stderr_mean" %in% names(sum_stats))
  expect_equivalent(sum_stats$stderr_mean, 0.5045, tolerance = 0.0001)

  expect_true("stdev" %in% names(sum_stats))
  expect_equivalent(sum_stats$stdev, 1.6816, tolerance = 0.0001)

  expect_true("variance" %in% names(sum_stats))
  expect_equivalent(sum_stats$variance, 2.8279, tolerance = 0.0001)

  expect_true("median" %in% names(sum_stats))
  expect_equal(sum_stats$median, -69.87976, tolerance = 0.0001)

  expect_true("mode" %in% names(sum_stats))
  expect_equal(sum_stats$mode, "n/a")

  expect_true("geom_mean" %in% names(sum_stats))
  expect_equal(sum_stats$geom_mea, "n/a")

  expect_true("hpd_interval_low" %in% names(sum_stats))
  expect_equivalent(sum_stats$hpd_interval_low, -74.1527, tolerance = 0.0001)

  expect_true("hpd_interval_high" %in% names(sum_stats))
  expect_equivalent(sum_stats$hpd_interval_high, -68.6852, tolerance = 0.0001)

  expect_true("act" %in% names(sum_stats))
  expect_equivalent(sum_stats$act, 1000, tolerance = 0.0001)

  expect_true("ess" %in% names(sum_stats))
  expect_equivalent(sum_stats$ess, 10, tolerance = 0.0001)

})

test_that("use, multiple trace", {

  estimates_all <- parse_beast_log(
    get_tracerer_path("beast2_example_output.log")
  )
  estimates <- remove_burn_ins(estimates_all, burn_in_fraction = 0.1)
  sum_stats <- calc_summary_stats(
    traces = estimates,
    sample_interval = 1000
  )
  sum_stats_single <- calc_summary_stats(
    trace = estimates$BirthDeath,
    sample_interval = 1000
  )

  # The first row
  row_index <- which(rownames(sum_stats) == "BirthDeath")
  expect_equivalent(
    sum_stats[row_index, ],
    sum_stats_single
  )

})

test_that("vignette", {

  estimates_all <- parse_beast_log(
    get_tracerer_path("beast2_example_output.log")
  )
  estimates <- remove_burn_ins(estimates_all, burn_in_fraction = 0.1)

  sum_stats_posterior <- calc_summary_stats(
    estimates$posterior,
    sample_interval = 1000
  )

})


test_that("abuse", {

  estimates_all <- parse_beast_log(
    get_tracerer_path("beast2_example_output.log")
  )
  estimates <- remove_burn_ins(estimates_all, burn_in_fraction = 0.1)

  expect_silent(
    calc_summary_stats(
      estimates$posterior,
      sample_interval = 1000
    )
  )

  expect_error(
    calc_summary_stats_trace(
      estimates,
      sample_interval = 1000
    ),
    "'trace' must be a numeric vector"
  )

  expect_error(
    calc_summary_stats_traces(
      estimates$posterior,
      sample_interval = 1000
    ),
    "'traces' must be a data frame"
  )

  expect_error(
    calc_summary_stats(
      "nonsense",
      sample_interval = 1000
    ),
    "'traces' must be a either a numeric vector or a data frame"
  )
})
