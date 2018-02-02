context("parse_beast_trees")

test_that("use", {

  filename <- get_path("beast2_example_output.trees")
  posterior <- parse_beast_trees(filename)
  expect_true(is_trees_posterior(posterior))
})


test_that("issue 4", {

  filename <- get_path("unplottable_anthus_aco.trees")
  trees <- parse_beast_trees(filename)
  class(trees) <- "multiPhylo"
  testthat::expect_silent(
    phangorn::densiTree(trees)
  )
})


test_that("abuse", {

  testthat::expect_error(
    parse_beast_trees(filename = "inva.lid"),
    "'filename' is the name of an absent file"
  )

  testthat::expect_error(
    parse_beast_trees(
      filename = get_path("beast2_example_output.log")
    ),
    "invalid file"
  )

})
