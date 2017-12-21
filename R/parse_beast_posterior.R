#' Parses BEAST2 output files to a posterior
#' @param trees_filename name of the BEAST2 .trees output file
#' @param log_filename name of the BEAST2 .trees output file
#' @return a posterior
#' @export
#' @examples
#'   trees_filename <- system.file(
#'    "extdata", "beast2_example_output.trees", package = "beastier"
#'   )
#'   log_filename <- system.file(
#'    "extdata", "beast2_example_output.log", package = "beastier"
#'   )
#'   posterior <- parse_beast_posterior(
#'     trees_filename = trees_filename,
#'     log_filename = log_filename
#'   )
#'   testit::assert(is_posterior(posterior))
#' @author Richel Bilderbeek
parse_beast_posterior <- function(trees_filename, log_filename) {

  if (!file.exists(trees_filename)) {
    stop("trees_filename absent")
  }

  if (!file.exists(log_filename)) {
    stop("log_filename absent")
  }

  posterior_trees <- beastier::parse_beast_trees(trees_filename)
  posterior_estimates <- beastier::parse_beast_log(log_filename)

  posterior <- list(
    trees = posterior_trees,
    estimates = posterior_estimates
  )
  testit::assert(beastier::is_posterior(posterior))
  posterior
}
