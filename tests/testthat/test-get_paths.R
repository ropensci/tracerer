test_that("get_tracerer_paths: use", {

  testthat::expect_equal(
    c(
      tracerer:::get_tracerer_path("beast2_example_output.log"),
      tracerer:::get_tracerer_path("beast2_example_output.trees")
    ),
    tracerer:::get_tracerer_paths(
      c("beast2_example_output.log", "beast2_example_output.trees")
    )
  )

})
