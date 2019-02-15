#' Parses a BEAST2 \code{.log} output file
#' @param filename name of the BEAST2 .log output file
#' @return data frame with the parameter estimates
#' @export
#' @examples
#'   log_filename <- get_tracerer_path("beast2_example_output.log")
#'   estimates <- parse_beast_log(filename = log_filename)
#'   expected_names <- c(
#'     "Sample", "posterior", "likelihood",
#'     "prior", "treeLikelihood", "TreeHeight",
#'     "BirthDeath", "birthRate2", "relativeDeathRate2"
#'   )
#'   testit::assert(names(estimates) == expected_names)
#' @seealso Use \code{\link{remove_burn_ins}} to remove the burn-in from
#'   the returned parameter estimates.
#'   Use \code{\link{save_beast_estimates}} to save the estimates
#'   to a \code{.log} file.
#' @author Richèl J.C. Bilderbeek
parse_beast_log <- function(
  filename
) {
  if (!file.exists(filename)) {
    stop("file absent. Could not find file with path '", filename, "'.")
  }

  estimates <- utils::read.csv(
    file = filename,
    header = TRUE,
    stringsAsFactors = FALSE,
    row.names = NULL,
    sep = "\t",
    comment.char = "#"
  )
  # Remove a column with the name X, no idea where it comes from
  estimates <- estimates[, !(names(estimates) %in% c("X"))]
  estimates
}
