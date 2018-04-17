#' Parses a BEAST2 .trees output file
#' @param filename name of the BEAST2 .trees output file
#' @return the phylogenies in the posterior
#' @export
#' @examples
#'   trees_filename <- get_tracerer_path("beast2_example_output.trees")
#'   posterior <- parse_beast_trees(trees_filename)
#'   testit::assert(is_trees_posterior(posterior))
#' @author Richel J.C. Bilderbeek
parse_beast_trees <- function(
  filename
) {

  if (!file.exists(filename)) {
    stop(
      "'filename' is the name of an absent file. ",
      "Filename '", filename, "' not found"
    )
  }

  trees <- tryCatch({
      ape::read.nexus(filename)
    },
    error = function(cond) {
      stop("invalid file")
    }
  )

  testit::assert(length(trees) != 1 || !is.na(trees))


  class(trees) <- "multiPhylo"
  # Use c to strip the state names and convert it to a pure multiPhylo
  c(trees)
}
