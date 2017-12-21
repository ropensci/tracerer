context("get_path")

test_that("use", {

  testthat::expect_equal(
    system.file("extdata", "beast2_example_output.log", package = "beastier"),
    beastier:::get_path("beast2_example_output.log")
  )

  testthat::expect_equal(
    system.file("extdata", "beast2_example_output.trees", package = "beastier"),
    beastier:::get_path("beast2_example_output.trees")
  )

})

test_that("abuse", {

  testthat::expect_error(
    beastier:::get_path("abs.ent"),
    "'filename' must be the name of a file in 'inst/extdata'"
  )

})
