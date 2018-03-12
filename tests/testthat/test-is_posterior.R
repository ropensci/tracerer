context("is_posterior")

test_that("detect posterior", {

  trees_filename <- get_tracerer_path("beast2_example_output.trees")
  testit::assert(file.exists(trees_filename))

  log_filename <- get_tracerer_path("beast2_example_output.log")
  testit::assert(file.exists(log_filename))

  posterior <- tracerer::parse_beast_posterior(
    trees_filename = trees_filename,
    log_filename = log_filename
  )
  names(posterior)
  testthat::expect_true(is_posterior(posterior))

})

test_that("detect non-posteriors", {

  testthat::expect_false(
    tracerer::is_posterior("nonsense")
  )

  testthat::expect_false(
    tracerer::is_posterior(list("estimates" = NA,  "nonsense" = NA))
  )
  testthat::expect_false(
    tracerer::is_posterior(list("_trees" = NA,  "nonsense" = NA))
  )

  testthat::expect_true(
    tracerer::is_posterior(list("_trees" = NA,  "estimates" = NA))
  )

})
