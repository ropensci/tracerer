test_that("column names are correct", {

  xml_state_filename <- get_tracerer_path("beast2_example_output.xml.state")
  estimates <- parse_beast_state_operators(state_filename = xml_state_filename)
  expected_names <- c("operator", "p", "accept", "reject", "acceptFC",
    "rejectFC", "rejectIv", "rejectOp")
  expect_equal(names(estimates), expected_names)
})

test_that("example", {

  xml_state_filename <- get_tracerer_path("beast2_example_output.xml.state")
  estimates <- parse_beast_state_operators(state_filename = xml_state_filename)
  expected_operators <- c("treeScaler.t", "treeRootScaler.t",
    "UniformOperator.t", "SubtreeSlide.t", "narrow.t", "wide.t",
    "WilsonBalding.t", "BirthRateScaler.t", "DeathRateScaler.t")
  expect_equal(estimates$operator, expected_operators)

})

test_that("abuse", {

  expect_error(
    parse_beast_state_operators(state_filename = "abs.ent"),
    "'filename' must be the name of an existing file"
  )

})

test_that("deprecation", {

  expect_error(
    parse_beast_state_operators(
      filename = "deprecated",
      state_filename = "irrelevant"
    ),
    "'filename' is deprecated, use 'state_filename' instead"
  )

})
