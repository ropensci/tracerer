library(testthat)
library(tracerer)

test_check("tracerer")

testthat::expect_equal(0, length(list.files(rappdirs::user_cache_dir(appname = "tracerer"))))
