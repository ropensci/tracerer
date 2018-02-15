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

test_that("remove burn-in", {

  out_all <- parse_beast_output_files(
    log_filename = get_path("beast2_example_output.log"),
    trees_filenames = get_path("beast2_example_output.trees"),
    state_filename = get_path("beast2_example_output.xml.state"),
    burn_in_fraction = 0.0
  )
  testthat::expect_equal(nrow(out_all$estimates), 11)

  out_sub <- parse_beast_output_files(
    log_filename = get_path("beast2_example_output.log"),
    trees_filenames = get_path("beast2_example_output.trees"),
    state_filename = get_path("beast2_example_output.xml.state"),
    burn_in_fraction = 0.1
  )
  testthat::expect_equal(nrow(out_sub$estimates), 10)

})
