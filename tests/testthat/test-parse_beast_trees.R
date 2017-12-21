context("parse_beast_trees")

test_that("parse_beast_trees: use", {

  filename <- get_path("beast2_example_output.trees")
  posterior <- parse_beast_trees(filename)
  expect_true(is_trees_posterior(posterior))
})

test_that("parse_beast_trees: abuse", {

  expect_error(
    parse_beast_trees(filename = "inva.lid"),
    "file absent"
  )

  log_filename <- get_path("beast2_example_output.log")
  testthat::expect_error(
    parse_beast_trees(
      filename = log_filename
    ),
    "invalid file"
  )

})
