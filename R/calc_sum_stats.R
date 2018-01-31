#' Calculates the Effective Sample Sizes from a parsed BEAST2 log file
#' @param traces a dataframe with traces with removed burn-in
#' @param sample_interval the interval in timesteps between samples
#' @param burn_in_fraction the fraction that needs to be removed, must be [0,1>
#' @return the effective sample sizes
#' @export
#' @author Richel J.C. Bilderbeek
calc_sum_stats <- function(
  traces,
  sample_interval,
  burn_in_fraction = 0.1
) {
  traces
}
