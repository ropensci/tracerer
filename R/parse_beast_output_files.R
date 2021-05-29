#' Parse all BEAST2 output files
#' @inheritParams default_params_doc
#' @return a list with the following elements:\cr
#'   \itemize{
#'     item{\code{estimates}: parameter estimates}
#'     item{
#'       \code{[alignment_id]_trees}: the phylogenies in the
#'       BEAST2 posterior. \code{[alignment_id]} is the ID
#'       of the alignment.
#'     }
#'     item{\code{operators}: the BEAST2 MCMC operator
#'       acceptances
#'     }
#'   }
#' @export
#' @examples
#' trees_filenames <- get_tracerer_path("beast2_example_output.trees")
#' log_filename <- get_tracerer_path("beast2_example_output.log")
#' state_filename <- get_tracerer_path("beast2_example_output.xml.state")
#' parse_beast_output_files(
#'   log_filename = log_filename,
#'   trees_filenames = trees_filenames,
#'   state_filename = state_filename
#' )
#' @seealso Use \code{\link{remove_burn_ins}} to remove the burn-in from
#'   \code{out$estimates}
#' @author Richèl J.C. Bilderbeek
parse_beast_output_files <- function(
  log_filename,
  trees_filenames,
  state_filename
) {
  out <- tracerer::parse_beast_posterior(
    trees_filenames = trees_filenames,
    tracelog_filename = log_filename
  )
  out$operators <- tracerer::parse_beast_state_operators(
    state_filename
  )
  out
}
