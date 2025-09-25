#' Get the full paths of files in the \code{inst/extdata} folder
#' @param filenames the files' names, without the path
#' @return the filenames' full paths
#' @author Richèl J.C. Bilderbeek
#' @encoding UTF-8
#' @seealso for one file, use \code{\link{get_tracerer_path}}
#' @examples
#' get_tracerer_paths(
#'   c(
#'     "beast2_example_output.log",
#'     "beast2_example_output.trees",
#'     "beast2_example_output.xml",
#'     "beast2_example_output.xml.state"
#'   )
#' )
#' @export
get_tracerer_paths <- function(filenames) {

  for (i in seq_along(filenames)) {
    filenames[i] <- get_tracerer_path(filenames[i]) # nolint internal function
  }

  filenames
}
