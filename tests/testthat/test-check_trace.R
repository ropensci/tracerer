test_that("use", {
  expect_silent(check_trace(trace = seq(1, 2)))
  expect_error(
    check_trace(trace = "not numeric"),
    "'trace' must be numeric"
  )
})
