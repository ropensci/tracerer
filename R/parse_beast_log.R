#' Deprecated function to parse a BEAST2 \code{.log} output file.
#' Use \link{parse_beast_tracelog_file} instead
#' @inheritParams default_params_doc
#' @param filename deprecated name of the BEAST2 .log output file
#' @return data frame with the parameter estimates
#' @export
#' @examples
#' # Deprecated
#' parse_beast_log(
#'   tracelog_filename = get_tracerer_path("beast2_example_output.log")
#' )
#' # Use the function 'parse_beast_tracelog_file' instead
#' parse_beast_tracelog_file(
#'   tracelog_filename = get_tracerer_path("beast2_example_output.log")
#' )
#' @author Richèl J.C. Bilderbeek
parse_beast_log <- function(
  tracelog_filename,
  filename = "deprecated"
) {
  # Check for deprecated argument names
  calls <- names(sapply(match.call(), deparse))[-1]
  if (any("filename" %in% calls)) {
    stop(
      "'filename' is deprecated, use 'tracelog_filename' instead"
    )
  }
  warning(
    "'parse_beast_log' will be deprecated. ",
    "Use 'parse_beast_tracelog_file' instead"
  )
  tracerer::parse_beast_tracelog_file(
    tracelog_filename = tracelog_filename
  )
}
