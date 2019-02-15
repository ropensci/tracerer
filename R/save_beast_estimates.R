#' Save the BEAST2 estimates as a BEAST2 \code{.log} file.
#' There will be some differences: a BEAST2 \code{.log} file also saves
#' the model as comments and formats the numbers in a way non-standard to R
#' @param estimates a data frame of BEAST2 parameter estimates
#' @param filename name of the \code{.log} file to save to
#' @return nothing
#' @seealso Use \code{\link{parse_beast_log}} to read a BEAST2 \code{.log} file
#' @author Richèl J.C. Bilderbeek
#' @export
save_beast_estimates <- function(
  estimates,
  filename
) {
  if (!is.data.frame(estimates)) {
    stop("'estimates' must be a data.frame")
  }
  if (!is.character(filename) || stringr::str_length(filename) == 0) {
    stop("'filename' must have at least one character")
  }

  # Using 'x = format(estimates, digits = 16)' saves with more digits,
  # but messes up the lines
  utils::write.table(
    x = estimates,
    file = filename,
    sep = "\t",
    quote = FALSE,
    eol = "\t\n",
    row.names = FALSE
  )
}
