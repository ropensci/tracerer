context("parse_beast_output_files")

test_that("use", {

  testthat::expect_silent(
    parse_beast_output_files(
      log_filename = get_path("beast2_example_output.log"),
      trees_filenames = get_path("beast2_example_output.trees"),
      state_filename = get_path("beast2_example_output.xml.state")
    )
  )

})
