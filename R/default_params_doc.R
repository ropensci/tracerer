#' Documentation of general function arguments.
#' This function does nothing.
#' It is intended to inherit function argument documentation.
#' @param log_filename deprecated name
#' of the BEAST2 tracelog \code{.log} output file.
#' Use \code{tracelog_filename} instead
#' @param sample_interval the interval in timesteps between samples
#' @param state_filename name of the BEAST2 state \code{.xml.state} output file
#' @param trace the values
#' @param tracelog_filename name of the BEAST2 tracelog \code{.log} output file,
#' as can be read using \link{parse_beast_tracelog_file}
#' @param trees_filename name of a BEAST2 posterior \code{.trees} file,
#' as can be read using \link{parse_beast_trees}
#' @param trees_filenames the names of one or more a BEAST2
#'   posterior \code{.trees} file.
#'   Each \code{.trees} file can be read using \link{parse_beast_trees}
#' @param verbose set to TRUE for more output
#' @author Richèl J.C. Bilderbeek
#' @note This is an internal function, so it should be marked with
#'   \code{@noRd}. This is not done, as this will disallow all
#'   functions to find the documentation parameters
default_params_doc <- function(
  log_filename,
  sample_interval,
  state_filename,
  trace,
  tracelog_filename,
  trees_filename,
  trees_filenames,
  verbose
) {
  # Nothing
}
