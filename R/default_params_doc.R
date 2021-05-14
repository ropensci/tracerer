#' Documentation of general function arguments.
#' This function does nothing.
#' It is intended to inherit function argument documentation.
#' @param sample_interval the interval in timesteps between samples
#' @param trace the values
#' @param trees_filename Name of a BEAST2 posterior \code{.trees} file.
#' @param verbose set to TRUE for more output
#' @author Richèl J.C. Bilderbeek
#' @note This is an internal function, so it should be marked with
#'   \code{@noRd}. This is not done, as this will disallow all
#'   functions to find the documentation parameters
default_params_doc <- function(
  sample_interval,
  trace,
  trees_filename,
  verbose
) {
  # Nothing
}
