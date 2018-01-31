context("calc_sum_stats")

test_that("vignette", {

  estimates <- parse_beast_log(get_path("beast2_example_output.log"))
  sum_stats <- calc_sum_stats(
    estimates$posterior,
    sample_interval = 1000,
    burn_in_fraction = 0.1
  )
  testthat::expect_true("mean" %in% names(sum_stats))
  testthat::expect_equivalent(sum_stats$mean, -70.5839, tolerance = 0.00001)
  testthat::expect_true("stderr_mean" %in% names(sum_stats))
  # Sloppy
  testthat::expect_equivalent(sum_stats$stderr_mean, 0.5045, tolerance = 0.1)

  testthat::expect_true("stdev" %in% names(sum_stats))
  testthat::expect_equivalent(sum_stats$stdev, 1.6816, tolerance = 0.0001)

  testthat::expect_true("variance" %in% names(sum_stats))
  testthat::expect_true("mode" %in% names(sum_stats))
  testthat::expect_true("geom_mean" %in% names(sum_stats))
  testthat::expect_true("hpd_interval" %in% names(sum_stats))
  testthat::expect_true("act" %in% names(sum_stats))
  testthat::expect_true("ess" %in% names(sum_stats))

})
