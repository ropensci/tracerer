#' Parse all BEAST2 output files
#' @param log_filename name of the BEAST2 .log file
#' @param trees_filenames name(s) of the BEAST2 .trees file(s) created.
#'   BEAST2 will create one .trees file per alignment
#' @param  state_filename name of the BEAST2 .xml.state file created
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
#'   trees_filenames <- get_tracerer_path("beast2_example_output.trees")
#'   log_filename <- get_tracerer_path("beast2_example_output.log")
#'   state_filename <- get_tracerer_path("beast2_example_output.xml.state")
#'   out <- parse_beast_output_files(
#'     log_filename = log_filename,
#'     trees_filenames = trees_filenames,
#'     state_filename = state_filename
#'   )
#'   testit::assert("estimates" %in% names(out))
#'   testit::assert("beast2_example_output_trees" %in% names(out))
#'   testit::assert("operators" %in% names(out))
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
    log_filename = log_filename
  )
  out$operators <- parse_beast_state_operators(
    state_filename
  )
  out
}
