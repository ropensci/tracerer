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
    "last line should be 'End;'"
  )

  expect_output(
    is_trees_file(get_tracerer_path("beast2_example_output.log"), verbose = TRUE),
    "last line should be 'End;'"
  )

  expect_output(
    is_trees_file(get_tracerer_path("beast2_example_output.xml"), verbose = TRUE),
    "last line should be 'End;'"
  )

  expect_output(
    is_trees_file(get_tracerer_path("beast2_example_output.xml.state"), verbose = TRUE),
    "last line should be 'End;'"
  )

})

test_that("use on absent file", {

  # The file lacks 'End;' as the last line
  expect_error(
    is_trees_file(tempfile(pattern = "absent")),
    "'trees_filename' is the name of an absent file"
  )
})

test_that("evil file", {

  trees_filename <- tempfile()
  text <- c("nonsense", "End;")
  writeLines(text, trees_filename)

  expect_output(
    is_trees_file(trees_filename, verbose = TRUE),
    "Error message: argument of length 0"
  )
})
