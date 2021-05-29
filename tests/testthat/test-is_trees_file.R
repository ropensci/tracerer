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
  expect_message(
    tracerer::is_trees_file(
      trees_filename = get_tracerer_path("mcbette_issue_8.trees"),
      verbose = TRUE
    ),
    "last line should be 'End;'"
  )

  expect_message(
    is_trees_file(
      get_tracerer_path("beast2_example_output.log"), verbose = TRUE
    ),
    "last line should be 'End;'"
  )

  expect_message(
    is_trees_file(
      get_tracerer_path("beast2_example_output.xml"),
      verbose = TRUE
    ),
    "last line should be 'End;'"
  )

  expect_message(
    is_trees_file(
      get_tracerer_path("beast2_example_output.xml.state"),
      verbose = TRUE
    ),
    "last line should be 'End;'"
  )

})

test_that("use on absent file", {

  # The file lacks 'End;' as the last line
  expect_error(
    is_trees_file(get_tracerer_tempfilename(pattern = "absent")),
    "'trees_filename' is the name of an absent file"
  )
})

test_that("evil file", {

  folder_name <- get_tracerer_tempfilename()
  dir.create(folder_name, showWarnings = FALSE, recursive = TRUE)
  trees_filename <- file.path(folder_name, "is_trees_file")
  text <- c("nonsense", "End;")
  writeLines(text, trees_filename)

  expect_message(
    is_trees_file(trees_filename, verbose = TRUE),
    "Error message: argument of length 0"
  )
  unlink(folder_name)
})
