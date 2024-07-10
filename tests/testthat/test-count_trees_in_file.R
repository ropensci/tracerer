test_that("count_trees_in_file: use", {

  trees_filename <- get_tracerer_path("beast2_example_output.trees")
  created <- count_trees_in_file(trees_filename)
  expected <- length(parse_beast_trees(trees_filename))
  expect_equal(created, expected)
})

test_that("count_trees_in_file: abuse", {
  expect_error(
    count_trees_in_file("abs.ent"),
    "'trees_filename' absent"
  )
  expect_error(
    count_trees_in_file(get_tracerer_path("mcbette_issue_8.trees")),
    "'trees_filename' invalid"
  )
})


test_that("count_trees_in_file (#4)", {

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
