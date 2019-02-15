#' Parses a BEAST2 .xml.state output file to get only the operators
#'   acceptances
#' @param filename name of the BEAST2 .xml.state output file
#' @return data frame with all the operators' success rates
#' @export
#' @usage
#'   parse_beast_state_operators(
#'     filename = get_tracerer_path("beast2_example_output.xml.state")
#'   )
#' @examples
#'   xml_state_filename <- get_tracerer_path("beast2_example_output.xml.state")
#'   estimates <- parse_beast_state_operators(filename = xml_state_filename)
#'   expected_names <- c("operator", "p", "accept", "reject", "acceptFC",
#'     "rejectFC", "rejectIv", "rejectOp")
#'   expected_operator <- c("treeScaler.t", "treeRootScaler.t",
#'     "UniformOperator.t", "SubtreeSlide.t", "narrow.t", "wide.t",
#'     "WilsonBalding.t", "BirthRateScaler.t", "DeathRateScaler.t")
#'   testit::assert(names(estimates) == expected_names)
#'   #testit::assert(estimates$operator == expected_operators)
#' @author Richèl J.C. Bilderbeek
parse_beast_state_operators <- function(
    filename = get_tracerer_path("beast2_example_output.xml.state")
) {
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
