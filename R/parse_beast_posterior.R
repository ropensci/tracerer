#' Parses BEAST2 output files to a posterior
#' @inheritParams default_params_doc
#' @return a list with the following elements:\cr
#'   \itemize{
#'     item{\code{estimates}: parameter estimates}
#'     item{
#'       \code{[alignment_id]_trees}: the phylogenies in the
#'       BEAST2 posterior. \code{[alignment_id]} is the ID
#'       of the alignment.
#'     }
#'   }
#' @export
#' @examples
#' trees_filenames <- get_tracerer_path("beast2_example_output.trees")
#' tracelog_filename <- get_tracerer_path("beast2_example_output.log")
#' posterior <- parse_beast_posterior(
#'   trees_filenames = trees_filenames,
#'   tracelog_filename = tracelog_filename
#' )
#' @seealso Use \code{\link{remove_burn_ins}} to remove the burn-ins from
#'   the posterior's estimates (\code{posterior$estimates})
#' @author Richèl J.C. Bilderbeek
parse_beast_posterior <- function(
  trees_filenames,
  tracelog_filename,
  log_filename = "deprecated"
) {
  # Check for deprecated argument names
  calls <- names(sapply(match.call(), deparse))[-1]
  if (any("log_filename" %in% calls)) {
    stop(
      "'log_filename' is deprecated, use 'tracelog_filename' instead"
    )
  }

  if (!all(file.exists(trees_filenames))) {
    stop("'trees_filenames' must be the name of one or more existing files. ",
      "File(s) with name(s) '", trees_filenames, "' not found")
  }

  if (!file.exists(tracelog_filename)) {
    stop("'tracelog_filename' must be the name of an existing file. ",
      "File with name '", tracelog_filename, "' not found")
  }

  posterior <- list()
  for (i in seq_along(trees_filenames)) {
    trees_filename <- trees_filenames[i]
    posterior[[i]] <- tracerer::parse_beast_trees(
      trees_filename
    )
  }
  n_trees <- length(trees_filenames)
  posterior[[n_trees + 1]] <- tracerer::parse_beast_tracelog_file(
    tracelog_filename = tracelog_filename
  )
  names(posterior) <- c(
    paste0(basename(tools::file_path_sans_ext(trees_filenames)), "_trees"),
    "estimates"
  )
  posterior
}
