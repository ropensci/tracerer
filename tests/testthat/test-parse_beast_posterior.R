context("parse_beast_posterior")

test_that("use", {


})

test_that("abuse", {

  testthat::expect_silent(
    parse_beast_posterior(
      trees_filename = get_path("beast2_example_output.trees"),
      log_filename = get_path("beast2_example_output.log")
    )
  )

  testthat::expect_error(
    parse_beast_posterior(
      trees_filename = "abs.ent",
      log_filename = get_path("beast2_example_output.log")
    ),
    "'trees_filename' must be the name of an existing file"
  )

  testthat::expect_error(
    parse_beast_posterior(
      trees_filename = get_path("beast2_example_output.trees"),
      log_filename = "abs.ent"
    ),
    "'log_filename' must be the name of an existing file"
  )

})
