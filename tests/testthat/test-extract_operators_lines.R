context("extract_operators_lines")

test_that("abuse", {

  testthat::expect_silent(
    extract_operators_lines(
      get_tracerer_path("beast2_example_output.xml.state")
    )
  )
})

test_that("abuse", {

  testthat::expect_error(
    extract_operators_lines(filename = "abs.ent"),
    "'filename' must be the name of an existing file"
  )

  testthat::expect_error(
    extract_operators_lines(
      filename = get_tracerer_path("beast2_example_output.trees")
    ),
    "Start of BEAST2 operators JSON not found"
  )

})
