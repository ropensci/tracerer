context("is_posterior")

test_that("detect posterior", {

  trees_filename <- system.file(
    "extdata", "beast2_example_output.trees", package = "beastier"
  )
  testit::assert(file.exists(trees_filename))

  log_filename <- system.file(
    "extdata", "beast2_example_output.log", package = "beastier"
  )
  testit::assert(file.exists(log_filename))

  posterior <- beastier::parse_beast_posterior(
    trees_filename = trees_filename,
    log_filename = log_filename
  )
  testthat::expect_true(is_posterior(posterior))

})

test_that("detect non-posteriors", {

  testthat::expect_false(
    beastier::is_posterior("nonsense")
  )

  testthat::expect_false(
    beastier::is_posterior(list("estimates" = NA,  "nonsense" = NA))
  )
  testthat::expect_false(
    beastier::is_posterior(list("trees" = NA,  "nonsense" = NA))
  )

  testthat::expect_true(
    beastier::is_posterior(list("trees" = NA,  "estimates" = NA))
  )

})
