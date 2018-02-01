#' Parses a BEAST2 .trees output file
#' @param filename name of the BEAST2 .trees output file
#' @param return_type the data type of the returned value. Can be either
#'   'list' or 'multiPhylo'
#' @return the phylogenies in the posterior
#' @export
#' @examples
#'   trees_filename <- get_path("beast2_example_output.trees")
#'   posterior <- parse_beast_trees(trees_filename)
#'   testit::assert(is_trees_posterior(posterior))
#' @author Richel J.C. Bilderbeek
parse_beast_trees <- function(
  filename,
  return_type = "list"
) {

  if (!file.exists(filename)) {
    stop(
      "'filename' is the name of an absent file. ",
      "Filenamee '", filename, "' not found"
    )
  }
  if (return_type != "list" && return_type != "multiPhylo") {
    stop("'return_type' must be either 'list' or 'multiPhylo'")
  }

  trees <- tryCatch({
      rBEAST::beast2out.read.trees(filename)
    },
    error = function(cond) {
      stop("invalid file")
    }
  )

  testit::assert(length(trees) != 1 || !is.na(trees))

  if (return_type == "multiPhylo") {
    class(trees) <- "multiPhylo"
  }
  trees
}
