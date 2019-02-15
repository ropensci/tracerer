#' Parses a BEAST2 .trees output file
#' @param filename name of the BEAST2 .trees output file
#' @return the phylogenies in the posterior
#' @export
#' @examples
#'   trees_filename <- get_tracerer_path("beast2_example_output.trees")
#'   posterior <- parse_beast_trees(trees_filename)
#'   testit::assert(is_trees_posterior(posterior))
#' @seealso
#'   Use \code{\link{save_beast_trees}} to save the phylogenies
#'   to a \code{.trees} file.
#' @author Richèl J.C. Bilderbeek
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
      # Cannot use ape::read.tree, as that's incompatible with BEAST2's output
      ape::read.nexus(filename)
    },
    error = function(cond) {
      stop("invalid file")
    }
  )

  testit::assert(length(trees) != 1 || !is.na(trees))


  class(trees) <- "multiPhylo"
  # Use c to strip the state names and convert it to a pure multiPhylo
  trees <- c(trees)

  # Check if it matches the file
  n_trees_in_file <- tracerer::count_trees_in_file(filename)
  n_trees_in_output <- length(trees)
  testit::assert(n_trees_in_file == n_trees_in_output)

  trees
}
