context("test-save_beast_trees")

test_that("use", {

  filename_1 <- get_tracerer_path("beast2_example_output.trees")
  trees_1 <- parse_beast_trees(filename = filename_1)
  filename_2 <- tempfile(pattern = ".trees")
  save_beast_trees(trees = trees_1, filename = filename_2)
  trees_2 <- parse_beast_trees(filename = filename_2)
  expect_equal(trees_1, trees_2)
})

test_that("abuse", {

  trees <- c(ape::read.tree(text = "((A,B),C);"))
  expect_error(
    save_beast_trees(trees = "nonsense", filename = tempfile()),
    "'trees' must be of class 'multiPhylo'"
  )
  expect_error(
    save_beast_trees(trees = trees, filename = NA),
    "'filename' must have at least one character"
  )
  expect_error(
    save_beast_trees(trees = trees, filename = NULL),
    "'filename' must have at least one character"
  )
  expect_error(
    save_beast_trees(trees = trees, filename = ""),
    "'filename' must have at least one character"
  )
})
