context("calc_esses")

test_that("calc_esses: use", {

  estimates_all <- parse_beast_log(get_tracerer_path("beast2_example_output.log"))
  estimates <- remove_burn_ins(estimates_all, burn_in_fraction = 0.1)

  df <- calc_esses(
    traces = estimates,
    sample_interval = 1000
  )
  df

  # Create a data frame with same names
  df_expected <- df
  # Overwrite content with desired content
  df_expected[1, ] <- c(10, 10, 10, 10, 7, 10, 9, 6)

  testthat::expect_true(identical(df, df_expected))
})

test_that("calc_esses: abuse", {

  expect_error(
    calc_esses(traces = "not numeric", sample_interval = 1),
    "traces must be a data.frame"
  )

  expect_error(
    calc_esses(
      traces = data.frame(x = seq(1, 10), y = seq(2, 11)),
      sample_interval = 0
    ),
    "sample interval must be at least one"
  )

})
