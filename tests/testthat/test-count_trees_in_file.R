context("test-count_trees_in_file")

test_that("use", {

  trees_filename <- get_tracerer_path("beast2_example_output.trees")
  created <- count_trees_in_file(trees_filename)
  expected <- length(parse_beast_trees(trees_filename))
  expect_equal(created, expected)
})

test_that("abuse", {
  expect_error(
    count_trees_in_file("abs.ent"),
    "'trees_filename' absent"
  )
})


test_that("issue 4", {

  trees_filename <- get_tracerer_path("unplottable_anthus_aco.trees")
  created <- count_trees_in_file(trees_filename)
  expected <- length(parse_beast_trees(trees_filename))
  expect_equal(created, expected)
})


test_that("get_tracerer_path returns multiPhlo with 'STATE_'s", {

  trees_filename <- get_tracerer_path("unplottable_anthus_aco.trees")
  created <- count_trees_in_file(trees_filename)
  expected <- length(parse_beast_trees(trees_filename))
  expect_equal(created, expected)
})
