context("calc_geom_mean")

test_that("use", {

  estimates <- parse_beast_log(get_path("beast2_example_output.log"))
  trace <- remove_burn_ins(estimates, burn_in_fraction = 0.1)

  result <- "nonsense"
  testthat::expect_silent(
    result <- tracerer:::calc_geom_mean(values = trace$posterior)
  )
  testthat::expect_true(is.na(result))

})
