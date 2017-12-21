context("get_paths")

test_that("use", {

  testthat::expect_equal(
    c(
      beastier:::get_path("beast2_example_output.log"),
      beastier:::get_path("beast2_example_output.trees")
    ),
    beastier:::get_paths(c("beast2_example_output.log", "beast2_example_output.trees"))
  )

})
