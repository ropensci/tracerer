context("has_unique_ids")

test_that("use for unique IDs", {

  text <- c(
    beautier:::parameter_to_xml(beautier::create_alpha_param(id = 0)),
    beautier:::parameter_to_xml(beautier::create_alpha_param(id = 1)),
    "nothing"
  )
  testthat::expect_true(has_unique_ids(text))

})

test_that("use for dupliucate IDs", {

  text <- c(
    beautier:::parameter_to_xml(beautier::create_alpha_param(id = 0)),
    beautier:::parameter_to_xml(beautier::create_alpha_param(id = 0))
  )

  testthat::expect_false(has_unique_ids(text))

})
