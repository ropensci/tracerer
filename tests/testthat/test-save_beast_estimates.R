test_that("use", {

  # Convert from file -> estimates -> file -> estimates
  # and compare the estimates (instead of the files)
  # because of the formatting of the BEAST2 log file
  filename_1 <- get_tracerer_path("beast2_example_output.log")
  estimates_1 <- parse_beast_tracelog_file(filename_1)

  folder_name <- get_tracerer_tempfilename()
  dir.create(folder_name, showWarnings = FALSE, recursive = TRUE)
  filename_2 <- file.path("save_beast_estimates")

  save_beast_estimates(estimates = estimates_1, filename = filename_2)
  estimates_2 <- parse_beast_tracelog_file(filename_2)
  lines_1 <- readLines(filename_1)
  lines_1 <- lines_1[
    is.na(stringr::str_match(string = lines_1, pattern = "#.*"))
  ]
  lines_2 <- readLines(filename_2)
  expect_equal(lines_1[1], lines_2[1])
  expect_equal(estimates_1, estimates_2)

  unlink(folder_name)
})

test_that("save in sub-sub-folder", {

  # Convert from file -> estimates -> file -> estimates
  # and compare the estimates (instead of the files)
  # because of the formatting of the BEAST2 log file
  estimates <- parse_beast_tracelog_file(
    get_tracerer_path("beast2_example_output.log")
  )

  folder_name <- get_tracerer_tempfilename()
  dir.create(folder_name, showWarnings = FALSE, recursive = TRUE)
  filename <- file.path(folder_name, "sub", "sub", "save_beast_estimates")

  expect_silent(
    save_beast_estimates(estimates = estimates, filename = filename)
  )

  unlink(folder_name)
})

test_that("abuse", {

  expect_error(
    save_beast_estimates(
      estimates = "nonsense", filename = get_tracerer_tempfilename()
    ),
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
