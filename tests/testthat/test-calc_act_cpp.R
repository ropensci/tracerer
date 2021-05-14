context("calc_act_cpp")

test_that("use", {

  # Could not find documentation how to fix the warning.
  # The warning used to be absent in R 3.4.4 and/or before June 2019.
  #
  # Warning message:
  # `tracerer:::calc_act_cpp(sample = seq(1, 10), sample_interval = 0)`         # nolint these notes are not commented code
  # generated a condition with class
  # std::invalid_argument/C++Error/error/condition.                             # nolint these notes are not commented code
  # It is less fragile to test custom conditions with `class`
  suppressWarnings(
    expect_error(
      tracerer:::calc_act_cpp(sample = seq(1, 10), sample_interval = 0),
      "sample interval must be at least one"
    )
  )
})
