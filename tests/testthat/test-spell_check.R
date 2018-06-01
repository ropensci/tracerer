context("spell_check")

test_that("no spelling errors", {
  ignore <- c(
    "babette",
    "BEAUti",
    "beautier",
    "beastier",
    "Bilderbeek",
    "Bouckaert",
    "DensiTree",
    "ESS",
    "ESSes",
    "extdata",
    "FASTA",
    "http",
    "JSON",
    "nolint",
    "phylogenies",
    "phylogeny",
    "reproducibly",
    "Remco",
    "Richel",
    "uk",
    "www"
  )
  errors <- devtools::spell_check(ignore = ignore)
  expect_equal(0, length(errors))
})
