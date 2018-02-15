#' Calculates the Effective Sample Sizes from a parsed BEAST2 log file
#' @param trace a numeric vector of values. Assumes the burn-in
#'   is removed.
#' @param sample_interval the interval in timesteps between samples
#' @return the effective sample sizes
#' @export
#' @seealso Use \code{\link{remove_burn_in}} to remove the burn-in
#' @author Richel J.C. Bilderbeek
calc_sum_stats <- function(
  trace,
  sample_interval
) {
  # use string "n/a" instead of NA
  geom_mean <- calc_geom_mean(trace)
  geom_mean <- ifelse(is.na(geom_mean), "n/a", geom_mean)
  mode <- calc_mode(trace)
  mode <- ifelse(is.na(mode), "n/a", mode)

  hpd_interval <- calc_hpd_interval(trace)

  data.frame(
    mean = mean(trace),
    stderr_mean = calc_stderr_mean(trace, sample_interval = sample_interval),
    stdev = stats::sd(trace),
    variance = stats::var(trace),
    mode = mode,
    geom_mean = geom_mean,
    hpd_interval_low = hpd_interval[1],
    hpd_interval_high = hpd_interval[2],
    act = calc_act(trace, sample_interval = sample_interval),
    ess = calc_ess(trace, sample_interval = sample_interval),
    stringsAsFactors = FALSE
  )
}
