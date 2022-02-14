context("parse_beast_trees")

test_that("use", {

  filename <- get_tracerer_path("beast2_example_output.trees")
  posterior <- parse_beast_trees(filename)
  expect_true(is_trees_posterior(posterior))
  expect_equal(length(posterior), 11)
})

test_that("detect missing 'End;'", {

  filename <- get_tracerer_path("missing_end.trees")
  expect_error(
    parse_beast_trees(filename),
    "Expect 'End;' \\(BEAST2\\) or 'END;' \\(ape::write.nexus\\) at the end of .trees file" # nolint indeed a long error message
  )
})


test_that("issue 4", {

  filename <- get_tracerer_path("unplottable_anthus_aco.trees")
  trees <- parse_beast_trees(filename)
  expect_silent(
    phangorn::densiTree(trees)
  )
})

test_that("Last line must be End or END, mcbette issue #8", {

  filename <- get_tracerer_path("mcbette_issue_8.trees")
  expect_error(
    parse_beast_trees(filename),
    "Expect 'End;' .BEAST2. or 'END;' .ape::write.nexus. at the end of .trees"
  )
})

test_that("Invalid file that does end with End", {
  folder_name <- get_tracerer_tempfilename()
  dir.create(folder_name, showWarnings = FALSE, recursive = TRUE)
  filename <- file.path(folder_name, "parse_beast_trees")

  writeLines(text = c("invalid", "End;"), con = filename, sep = "\n")
  expect_error(
    parse_beast_trees(filename),
    "invalid file"
  )
  unlink(folder_name, recursive = TRUE)
})

test_that("get_tracerer_path returns multiPhlo with 'STATE_'s", {
  skip("No idea what this test is for anymore")
  # Must be a clean multiPhylo
  # https://github.com/ropensci/babette/issues/10

  filename <- get_tracerer_path("unplottable_anthus_aco.trees")
  readLines(filename, warn = FALSE)
  trees <- parse_beast_trees(filename)
  testit::assert(
    all(grepl(pattern = "STATE_", x = names(trees)) == FALSE)
  )
})



test_that("abuse", {

  expect_error(
    parse_beast_trees(filename = "inva.lid"),
    "'filename' is the name of an absent file"
  )

  expect_error(
    parse_beast_trees(
      filename = get_tracerer_path("beast2_example_output.log")
    ),
    "Expect 'End;' \\(BEAST2\\) or 'END;' \\(ape::write.nexus\\) at the end of .trees file" # nolint indeed a long error message
  )

})
