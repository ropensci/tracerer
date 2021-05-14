context("test-save_beast_estimates")

test_that("use", {

  # Convert from file -> estimates -> file -> estimates
  # and compare the estimates (instead of the files)
  # because of the formatting of the BEAST2 log file
  filename_1 <- get_tracerer_path("beast2_example_output.log")
  estimates_1 <- parse_beast_tracelog_file(filename_1)
  filename_2 <- tempfile(pattern = ".log")
  save_beast_estimates(estimates = estimates_1, filename = filename_2)
  estimates_2 <- parse_beast_tracelog_file(filename_2)
  lines_1 <- readLines(filename_1)
  lines_1 <- lines_1[
    is.na(stringr::str_match(string = lines_1, pattern = "#.*"))
  ]
  lines_2 <- readLines(filename_2)
  expect_equal(lines_1[1], lines_2[1])
  expect_equal(estimates_1, estimates_2)
})

test_that("abuse", {

  expect_error(
    save_beast_estimates(estimates = "nonsense", filename = tempfile()),
    "'estimates' must be a data.frame"
  )
  expect_error(
    save_beast_estimates(estimates = data.frame(), filename = NA),
    "'filename' must have at least one character"
  )
  expect_error(
    save_beast_estimates(estimates = data.frame(), filename = NULL),
    "'filename' must have at least one character"
  )
  expect_error(
    save_beast_estimates(estimates = data.frame(), filename = ""),
    "'filename' must have at least one character"
  )
})
