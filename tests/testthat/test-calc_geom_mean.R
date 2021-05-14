context("calc_geom_mean")

test_that("use, posterior", {

  estimates <- parse_beast_tracelog_file(
    get_tracerer_path("beast2_example_output.log")
  )
  trace <- remove_burn_ins(estimates, burn_in_fraction = 0.1)

  result <- "nonsense"
  testthat::expect_silent(
    result <- tracerer:::calc_geom_mean(values = trace$posterior)
  )
  testthat::expect_true(is.na(result))

})

test_that("use, tree height", {

  estimates <- parse_beast_tracelog_file(get_tracerer_path("beast2_example_output.log"))
  trace <- remove_burn_ins(estimates, burn_in_fraction = 0.1)

  result <- "nonsense"
  testthat::expect_silent(
    result <- tracerer:::calc_geom_mean(values = trace$TreeHeight)
  )
  testthat::expect_equivalent(0.9104, result, tolerance = 0.01)

})
