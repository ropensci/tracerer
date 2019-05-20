#' Measure if a file a valid BEAST2 \code{.trees} file
#' @inheritParams default_params_doc
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
is_trees_file <- function(
  trees_filename,
  verbose = FALSE
) {
  if (!file.exists(trees_filename)) {
    stop(
      "'trees_filename' is the name of an absent file. ",
      "Filename '", trees_filename, "' not found"
    )
  }
  is_valid <- FALSE

  tryCatch({
      # Cannot use ape::read.tree, as that's incompatible with BEAST2's output
      ape::read.nexus(trees_filename)
      is_valid <- TRUE
    },
    error = function(e) {
      if (verbose) {
        print(paste("Error message:", e$message))
      }
    }
  )
  is_valid
}
