context("parse_beast_trees")

test_that("use", {

  filename <- get_path("beast2_example_output.trees")
  posterior <- parse_beast_trees(filename)
  expect_true(is_trees_posterior(posterior))
})

test_that("abuse", {

  expect_error(
    parse_beast_trees(filename = "inva.lid"),
    "file absent"
  )

  testthat::expect_error(
    parse_beast_trees(
      filename = get_path("beast2_example_output.log")
    ),
    "invalid file"
  )

})
