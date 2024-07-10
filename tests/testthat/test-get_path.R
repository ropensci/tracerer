test_that("get_tracerer_path: use", {

  testthat::expect_equal(
    system.file("extdata", "beast2_example_output.log", package = "tracerer"),
    tracerer:::get_tracerer_path("beast2_example_output.log")
  )

  testthat::expect_equal(
    system.file("extdata", "beast2_example_output.trees", package = "tracerer"),
    tracerer:::get_tracerer_path("beast2_example_output.trees")
  )

})

test_that("get_tracerer_path: abuse", {

  testthat::expect_error(
    tracerer:::get_tracerer_path("abs.ent"),
    "'filename' must be the name of a file in 'inst/extdata'"
  )

})
