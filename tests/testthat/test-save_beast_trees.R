context("test-save_beast_trees")

test_that("use", {

  filename_1 <- get_tracerer_path("beast2_example_output.trees")
  trees_1 <- parse_beast_trees(filename = filename_1)
  n_trees <- length(trees_1)

  filename_2 <- get_tracerer_tempfilename(fileext = ".trees")
  save_beast_trees(trees = trees_1, filename = filename_2)
  n_trees_in_file <- count_trees_in_file(filename_2)
  expect_equal(n_trees, n_trees_in_file)

  trees_2 <- parse_beast_trees(filename = filename_2)
  n_trees_again <- length(trees_2)
  expect_equal(n_trees, n_trees_again)

  expect_equal(trees_1, trees_2)

  file.remove(filename_2)
})

test_that("stress-test", {

  # 'save_beast_trees' can hold 16384 trees
  # and store it as a 4.915468 Mb file without problems
  if (1 == 2 && Sys.getenv("TRAVIS") != "") {
    trees_filename <- get_tracerer_tempfilename(fileext = ".trees")
    trees <- c(ape::rcoal(n = 10))
    for (i in seq(14)) {
      message(i)
      trees <- c(trees, trees)
      save_beast_trees(trees = trees, filename = trees_filename)
      expect_true(is_trees_file(trees_filename))
      message(paste(length(trees), "trees"))
      message(paste(file.size(trees_filename) / 1000000, "Mb"))
    }
    file.remove(trees_filename)
  }
})

test_that("abuse", {

  trees <- c(ape::read.tree(text = "((A,B),C);"))
  expect_error(
    save_beast_trees(
      trees = "nonsense",
      filename = get_tracerer_tempfilename()
    ),
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
