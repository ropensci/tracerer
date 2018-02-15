#' Parse all BEAST2 output files
#' @param log_filename name of the BEAST2 .log file
#' @param trees_filenames name(s) of the BEAST2 .trees file(s) created.
#'   BEAST2 will create one .trees file per alignment
#' @param  state_filename name of the BEAST2 .xml.state file created
#' @param burn_in_fraction the fraction of the parameter estimate that needs
#'   to be removed, must be [0,1>
#' @export
#' @examples
#'   trees_filenames <- get_path("beast2_example_output.trees")
#'   log_filename <- get_path("beast2_example_output.log")
#'   state_filename <- get_path("beast2_example_output.xml.state")
#'   out <- parse_beast_output_files(
#'     log_filename = log_filename,
#'     trees_filenames = trees_filenames,
#'     state_filename = state_filename
#'   )
#'   testit::assert("estimates" %in% names(out))
#'   testit::assert("beast2_example_output_trees" %in% names(out))
#'   testit::assert("operators" %in% names(out))
#' @author Richel J.C. Bilderbeek
parse_beast_output_files <- function(
  log_filename,
  trees_filenames,
  state_filename,
  burn_in_fraction = 0.1
) {
  if (burn_in_fraction < 0.0) {
    stop("'burn_in_fraction' must be at least zero")
  }
  if (burn_in_fraction > 1.0) {
    stop("'burn_in_fraction' must be one at most")
  }

  out <- tracerer::parse_beast_posterior(
    trees_filenames = trees_filenames,
    log_filename = log_filename,
    burn_in_fraction = burn_in_fraction
  )
  out$operators <- parse_beast_state_operators(
    state_filename
  )
  out
}
