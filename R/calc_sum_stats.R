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

  # use string "N.A" instead of NA
  geom_mean <- calc_geom_mean(traces)
  geom_mean <- ifelse(is.na(geom_mean), "N/A", geom_mean)
  mode <- calc_mode(traces)
  mode <- ifelse(is.na(mode), "N/A", mode)

  data.frame(
    mean = mean(traces),
    stderr_mean = calc_stderr_mean(traces, sample_interval = sample_interval),
    stdev = stats::sd(traces),
    variance = stats::var(traces),
    mode = mode,
    geom_mean = geom_mean,
    hpd_interval_low = 1,
    hpd_interval_high = 2,
    act = calc_act(traces, sample_interval = sample_interval),
    ess = calc_ess(traces, sample_interval = sample_interval)
  )
}
