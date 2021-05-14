#' Parses a BEAST2 tracelog \code{.log} output file
#' @inheritParams default_params_doc
#' @return data frame with the parameter estimates
#' @export
#' @examples
#' parse_beast_tracelog_file(
#'   tracelog_filename = get_tracerer_path("beast2_example_output.log")
#' )
#' @seealso Use \code{\link{remove_burn_ins}} to remove the burn-in from
#'   the returned parameter estimates.
#'   Use \code{\link{save_beast_estimates}} to save the estimates
#'   to a \code{.log} file.
#' @author Richèl J.C. Bilderbeek
parse_beast_tracelog_file <- function(
  tracelog_filename
) {
  if (!file.exists(tracelog_filename)) {
    stop(
      "file absent. Could not find file with path '", tracelog_filename, "'."
    )
  }

  estimates <- utils::read.csv(
    file = tracelog_filename,
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
