#' Determines if the input is a BEAST2 posterior
#' @param x the input
#' @return TRUE or FALSE
#' @author Richel J.C. Bilderbeek
#' @examples
#'   trees_filename <- get_path("beast2_example_output.trees")
#'   log_filename <- get_path("beast2_example_output.log")
#'   posterior <- parse_beast_posterior(
#'     trees_filename = trees_filename,
#'     log_filename = log_filename
#'   )
#'   testit::assert(is_posterior(posterior))
#' @export
is_posterior <- function(x) {

  if (class(x) != "list") {
    return(FALSE)
  }
  for (name in names(x)) {
    if (!grepl("trees$", name) && name != "estimates")
      return(FALSE)
  }
  return(TRUE)
}
