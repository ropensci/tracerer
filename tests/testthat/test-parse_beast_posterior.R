test_that("use, single alignment", {

  posterior <- parse_beast_posterior(
    trees_filename = get_tracerer_path("beast2_example_output.trees"),
    tracelog_filename = get_tracerer_path("beast2_example_output.log")
  )
  expect_true("beast2_example_output_trees" %in% names(posterior))
  expect_true("estimates" %in% names(posterior))
  expect_true(is_posterior(posterior))
})

test_that("use, two alignments", {

  posterior <- parse_beast_posterior(
    trees_filename = get_tracerer_paths(
      c("anthus_2_4_a.trees", "anthus_2_4_b.trees")
    ),
    tracelog_filename = get_tracerer_path("anthus_2_4.log")
  )
  expect_true("anthus_2_4_a_trees" %in% names(posterior))
  expect_true("anthus_2_4_b_trees" %in% names(posterior))
  expect_true("estimates" %in% names(posterior))
  expect_true(is_posterior(posterior))
})

test_that("abuse", {

  expect_silent(
    parse_beast_posterior(
      trees_filename = get_tracerer_path("beast2_example_output.trees"),
      tracelog_filename = get_tracerer_path("beast2_example_output.log")
    )
  )

  expect_error(
    parse_beast_posterior(
      trees_filename = "abs.ent",
      tracelog_filename = get_tracerer_path("beast2_example_output.log")
    ),
    "'trees_filenames' must be the name of one or more existing files"
  )

  expect_error(
    parse_beast_posterior(
      trees_filename = get_tracerer_path("beast2_example_output.trees"),
      tracelog_filename = "abs.ent"
    ),
    "'tracelog_filename' must be the name of an existing file"
  )

})

test_that("deprecation", {

  expect_error(
    parse_beast_posterior(
      trees_filename = "irrelevant",
      log_filename = "deprecated"
    ),
    "'log_filename' is deprecated, use 'tracelog_filename' instead"
  )
})
