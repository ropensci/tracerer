#' Parses a BEAST2 .log output file
#' @param filename name of the BEAST2 .log output file
#' @param burn_in_fraction the fraction of the parameter estimate that needs
#'   to be removed, must be [0,1>
#' @return data frame with all the parameter estimates
#' @export
#' @examples
#'   log_filename <- get_path("beast2_example_output.log")
#'   estimates <- parse_beast_log(filename = log_filename)
#'   expected_names <- c(
#'     "Sample", "posterior", "likelihood",
#'     "prior", "treeLikelihood", "TreeHeight",
#'     "BirthDeath", "birthRate2", "relativeDeathRate2"
#'   )
#'   testit::assert(names(estimates) == expected_names)
#' @author Richel J.C. Bilderbeek
parse_beast_log <- function(
  filename,
  burn_in_fraction = 0.0
) {
  if (!file.exists(filename)) {
    stop("file absent")
  }
  if (burn_in_fraction < 0.0) {
    stop("'burn_in_fraction' must be at least zero")
  }
  if (burn_in_fraction > 1.0) {
    stop("'burn_in_fraction' must be one at most")
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

  estimates <- remove_burn_ins(
    traces = estimates,
    burn_in_fraction = burn_in_fraction
  )

  estimates
}
