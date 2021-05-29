test_that("use", {
  expect_silent(get_tracerer_tempfilename())
  expect_silent(get_tracerer_tempfilename(pattern = "test"))
  expect_silent(get_tracerer_tempfilename(fileext = ".xml"))
})
