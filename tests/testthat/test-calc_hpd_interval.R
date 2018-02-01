context("calc_hpd_interval")

test_that("Use", {

  estimates <- parse_beast_log(get_path("beast2_example_output.log"))
  trace <- remove_burn_ins(estimates, burn_in_fraction = 0.1)

  hpd_interval <- tracerer:::calc_hpd_interval(trace$posterior)
  testthat::expect_equivalent(-74.1527, hpd_interval[1], tolerance = 0.01)
  testthat::expect_equivalent(-68.6852, hpd_interval[2], tolerance = 0.01)

})
