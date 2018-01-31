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
  # Remove burn-in
  traces <- remove_burn_in(traces, burn_in_fraction = burn_in_fraction)

  data.frame(
    mean = mean(traces),
    stderr_mean = calc_stderr_mean(traces),
    stdev = sd(traces),
    variance = var(traces),
    mode = calc_mode(traces),
    geom_mean = calc_geom_mean(traces),
    hpd_interval_low = 1,
    hpd_interval_high = 2,
    act = calc_act(traces, sample_interval = sample_interval),
    ess = calc_ess(traces, sample_interval = sample_interval)
  )
}
