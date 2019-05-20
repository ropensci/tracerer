test_that("use on valid file", {

  expect_true(is_trees_file(get_tracerer_path("beast2_example_output.trees")))
  expect_true(is_trees_file(get_tracerer_path("unplottable_anthus_aco.trees")))
  expect_true(is_trees_file(get_tracerer_path("anthus_2_4_a.trees")))
  expect_true(is_trees_file(get_tracerer_path("anthus_2_4_b.trees")))

})

test_that("use on invalid file", {

  # The file lacks 'End;' as the last line
  expect_false(is_trees_file(get_tracerer_path("mcbette_issue_8.trees")))

})

test_that("use on invalid file, with added verbosity", {

  # The file lacks 'End;' as the last line
  expect_output(
    tracerer::is_trees_file(trees_filename = get_tracerer_path("mcbette_issue_8.trees"), verbose = TRUE),
    "Error message: last line should be 'End;'"
  )

  expect_output(
    is_trees_file(get_tracerer_path("beast2_example_output.log"), verbose = TRUE),
    "Error message: last line should be 'End;'"
  )

  expect_output(
    is_trees_file(get_tracerer_path("beast2_example_output.xml"), verbose = TRUE),
    "Error message: last line should be 'End;'"
  )

  expect_output(
    is_trees_file(get_tracerer_path("beast2_example_output.xml.state"), verbose = TRUE),
    "Error message: last line should be 'End;'"
  )

})
