#' Parses BEAST2 output files to a posterior
#' @param trees_filename name of the BEAST2 .trees output file
#' @param log_filename name of the BEAST2 .trees output file
#' @return a posterior
#' @export
#' @examples
#'   trees_filename <- get_path("beast2_example_output.trees")
#'   log_filename <- get_path("beast2_example_output.log")
#'   posterior <- parse_beast_posterior(
#'     trees_filename = trees_filename,
#'     log_filename = log_filename
#'   )
#'   testit::assert(is_posterior(posterior))
#' @author Richel J.C. Bilderbeek
parse_beast_posterior <- function(
  trees_filename,
  log_filename
) {

  if (!file.exists(trees_filename)) {
    stop("'trees_filename' must be the name of an existing file. ",
      "File with name '", trees_filename, "' not found")
  }

  if (!file.exists(log_filename)) {
    stop("'log_filename' must be the name of an existing file. ",
      "File with name '", trees_filename, "' not found")
  }

  posterior_trees <- tracerer::parse_beast_trees(trees_filename)
  posterior_estimates <- tracerer::parse_beast_log(log_filename)

  posterior <- list(
    trees = posterior_trees,
    estimates = posterior_estimates
  )
  testit::assert(tracerer::is_posterior(posterior))
  posterior
}
