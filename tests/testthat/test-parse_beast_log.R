test_that("must match new version", {

  tracelog_filename <- get_tracerer_path("beast2_example_output.log")
  suppressWarnings(
    estimates <- parse_beast_log(
      tracelog_filename = tracelog_filename
    )
  )
  estimates_again <- parse_beast_tracelog_file(tracelog_filename)
  expect_equal(names(estimates), names(estimates_again))

})

test_that("must match new version", {

  expect_warning(
    parse_beast_log(
      tracelog_filename = get_tracerer_path("beast2_example_output.log")
    ),
    "'parse_beast_log' will be deprecated. Use 'parse_beast_tracelog_file' instead" # nolint indeed a long warning
  )
})

test_that("deprecation", {
  expect_error(
    parse_beast_log(
      filename = "deprecated",
      tracelog_filename = "irrelevant"
    ),
    "'filename' is deprecated, use 'tracelog_filename' instead"
  )
})
