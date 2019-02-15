#' Extract the JSON lines out of a \code{.xml.state} with
#'   the unparsed BEAST2 MCMC operator acceptances
#' file with the operators
#' @param filename name of the BEAST2 .xml.state output file
#' @return the JSON lines of a \code{.xml.state} file with
#'   the unparsed BEAST2 MCMC operator acceptances
#' @export
#' @author Richèl J.C. Bilderbeek
extract_operators_lines <- function(filename) {

  if (!file.exists(filename)) {
    stop("'filename' must be the name of an existing file. ",
      "File '", filename, "' not found")
  }

  lines <- readLines(filename, warn = FALSE)

  start_indices <- lines ==  "{\"operators\":["
  if (sum(start_indices) != 1) {
    stop("Start of BEAST2 operators JSON not found")
  }
  start_index <- which(start_indices == TRUE)
  testit::assert(lines[start_index] == "{\"operators\":[")

  end_indices <- lines ==  "]}"
  testit::assert(sum(end_indices) == 1)
  end_index <- which(end_indices == TRUE)
  testit::assert(lines[end_index] == "]}")

  operator_lines <- lines[start_index:end_index]
  operator_lines
}
