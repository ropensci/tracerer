test_that("use", {

  filename <- get_tracerer_path("beast2_example_output.log")

  estimates <- parse_beast_tracelog_file(
    tracelog_filename = filename
  )
  expected_names <- c(
   "Sample", "posterior", "likelihood",
   "prior", "treeLikelihood", "TreeHeight",
   "BirthDeath", "birthRate2", "relativeDeathRate2"
  )
  testthat::expect_equal(names(estimates), expected_names)

})

test_that("abuse", {

  expect_error(
    parse_beast_tracelog_file(tracelog_filename = "inva.lid"),
    "file absent"
  )

})
