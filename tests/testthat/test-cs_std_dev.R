context("cs_std_dev")

test_that("use case 1", {

  # values: 1.0 and 2.0
  #
  # mean: 1.5
  # es: (-0.5, 0.5)
  # ses: (0.25, 0.25)
  # sses: 0.5
  # n: 2
  # f: 1 / (2 - 1) = 1
  # cs_std_dev = sqrt(f * sses) = 1 * sqrt(1 * 0.5) = 0.707
  testthat::expect_equal(sqrt(0.5), cs_std_dev(c(1.0, 2.0)))

})

test_that("use case 2", {

  # values: 1.0, 2.0 and 3.0
  #
  # mean: 2.0
  # es: (-1.0, 0.0, 1.0)
  # ses: (1.0, 0.0, 1.0)
  # sses: 2.0
  # n: 3
  # f: 1 / (3 - 1) = 0.5
  # cs_std_dev = sqrt(f * sses) = sqrt(0.5 * 2.0) = 1.0
  testthat::expect_equal(sqrt(1.0), cs_std_dev(c(1.0, 2.0, 3.0)))

})

test_that("use case 3", {

  # values: 1.0, 2.0, 3.0, 4.0
  #
  # mean: 2.5
  # es: (-1.5, -0.5, 0.5, 1.5)
  # ses: (2.25, 0.25, 0.25, 2.25)
  # sses: 5.0
  # n: 4
  # f: 1 / (4 - 1) = 0.3333
  # cs_std_dev = sqrt(f * sses) = sqrt(0.3333 * 5.0) = 1.29
  testthat::expect_equal(sqrt(5.0 / 3.0), cs_std_dev(c(1.0, 2.0, 3.0, 4.0)))

})
