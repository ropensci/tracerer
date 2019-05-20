test_that("use on valid file", {

  filename <- get_tracerer_path("beast2_example_output.trees")
  testit::assert(file.exists(filename))
  expect_true(is_trees_file(filename))

})

test_that("use on invalid file", {

  # The file lacks 'End;' as the last line
  filename <- get_tracerer_path("mcbette_issue_8.trees")
  testit::assert(file.exists(filename))
  expect_false(is_trees_file(filename))

})

test_that("use on invalid file, with added verbosity", {

  # The file lacks 'End;' as the last line
  filename <- get_tracerer_path("mcbette_issue_8.trees")
  testit::assert(file.exists(filename))
  expect_output(
    is_trees_file(filename, verbose = TRUE)
  )

})
