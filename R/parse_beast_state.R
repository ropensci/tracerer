#' Parses a BEAST2 state \code{.xml.state} output file to get only the operators
#'   acceptances
#' @inheritParams default_params_doc
#' @param filename deprecated name of the BEAST2 .xml.state output file,
#'   use \code{state_filename} instead
#' @return data frame with all the operators' success rates
#' @export
#' @examples
#' parse_beast_state_operators(
#'   state_filename = get_tracerer_path("beast2_example_output.xml.state")
#' )
#' @author Richèl J.C. Bilderbeek
parse_beast_state_operators <- function(
  state_filename = get_tracerer_path("beast2_example_output.xml.state"),
  filename = "deprecated"
) {
  # Check for deprecated argument names
  calls <- names(sapply(match.call(), deparse))[-1]
  if (any("filename" %in% calls)) {
    stop(
      "'filename' is deprecated, use 'state_filename' instead"
    )
  }

  # Do not be smart yet
  filename <- state_filename
  if (!file.exists(filename)) {
    stop("'filename' must be the name of an existing file. ",
      "File '", filename, "' not found")
  }

  lines <- tracerer::extract_operators_lines(filename)
  json <- jsonlite::fromJSON(lines)
  df <- as.data.frame(json)
  names(df) <- gsub("operators.", "", names(df))
  testit::assert(names(df)[1] == "id")
  names(df)[1] <- "operator"

  # 'WilsonBalding.t:test-alignment_to_beast_posterior' -> 'WilsonBalding.t' # nolint this is a regular comment, not code
  df$operator <- gsub(":.*", "", df$operator)

  df
}
