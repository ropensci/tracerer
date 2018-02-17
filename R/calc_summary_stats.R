#' Calculates the Effective Sample Sizes of one estimated variable's trace.
#' @param traces one or more traces, supplies as either a numeric
#'   vector or data frame or numeric vector of values.
#'   Assumes the burn-in is removed.
#' @param sample_interval the interval in timesteps between samples
#' @return the effective sample sizes
#' @export
#' @seealso Use \code{\link{calc_summary_stats_trace}} to calculate the
#'   ESS of one trace (stored as a numeric vector). Use
#'   \code{\link{calc_summary_stats_traces}} to calculate the
#'   ESSes of more traces (stored as a data frame).
#' @examples
#'   estimates_all <- parse_beast_log(get_path("beast2_example_output.log"))
#'   estimates <- remove_burn_ins(estimates_all, burn_in_fraction = 0.1)
#'
#'   # From a single variable's trace
#'   sum_stats_posterior <- calc_summary_stats(
#'     estimates$posterior,
#'     sample_interval = 1000
#'   )
#'
#'   testit::assert("mean" %in% names(sum_stats_posterior))
#'
#'   # From all variables' traces
#'   sum_stats <- calc_summary_stats(
#'     estimates,
#'     sample_interval = 1000
#'   )
#'
#'   testit::assert("mean" %in% colnames(sum_stats))
#' @author Richel J.C. Bilderbeek
calc_summary_stats <- function(
  traces,
  sample_interval
) {
  if(is.data.frame(traces)) {
    calc_summary_stats_traces(traces, sample_interval = sample_interval)
  } else if (is.vector(traces, mode = "numeric")) {
    calc_summary_stats_trace(traces, sample_interval = sample_interval)
  } else {
    stop("'traces' must be a either a numeric vector or a data frame")
  }
}

#' Calculates the Effective Sample Sizes of one estimated variable's trace.
#' @param trace a numeric vector of values. Assumes the burn-in
#'   is removed.
#' @param sample_interval the interval in timesteps between samples
#' @return the effective sample sizes
#' @export
#' @seealso Use \code{\link{remove_burn_in}} to remove the burn-in
#'   of a trace
#' @examples
#'   estimates_all <- parse_beast_log(get_path("beast2_example_output.log"))
#'   estimates <- remove_burn_ins(estimates_all, burn_in_fraction = 0.1)
#'
#'   sum_stats <- calc_summary_stats_trace(
#'     estimates$posterior,
#'     sample_interval = 1000
#'   )
#'
#'   testit::assert("mean" %in% names(sum_stats))
#' @author Richel J.C. Bilderbeek
calc_summary_stats_trace <- function(
  trace,
  sample_interval
) {
  if (!is.vector(trace, mode = "numeric")) {
    stop("'trace' must be a numeric vector")
  }
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

#' Calculates the Effective Sample Sizes of the traces of multiple
#'   estimated variables.
#' @param trace a data frame with traces of estimated parameters.
#'   Assumes the burn-ins are removed.
#' @param sample_interval the interval in timesteps between samples
#' @return the effective sample sizes
#' @export
#' @seealso Use \code{\link{remove_burn_ins}} to remove the burn-ins
#'   of all traces
#' @examples
#'   estimates_all <- parse_beast_log(get_path("beast2_example_output.log"))
#'   estimates <- remove_burn_ins(estimates_all, burn_in_fraction = 0.1)
#'
#'   sum_stats <- calc_summary_stats_traces(
#'     estimates,
#'     sample_interval = 1000
#'   )
#'
#'   testit::assert("mean" %in% colnames(sum_stats))
#' @author Richel J.C. Bilderbeek
calc_summary_stats_traces <- function(
  traces,
  sample_interval
) {
  if (!is.data.frame(traces)) {
    stop("'traces' must be a data frame")
  }
  # Remove column 'Samples' iff present
  traces <- subset(traces, select = -Sample) # nolint use uppercase variable name just like BEAST2

  n_sum_stats <- 10

  df <- data.frame(matrix(NA, nrow = length(colnames(traces)), ncol = n_sum_stats))
  colnames(df) <- names(calc_summary_stats_trace(traces[, 1], sample_interval))
  rownames(df) <- names(traces)

  for (i in seq_along(colnames(traces))) {
    df[i, ] <- calc_summary_stats_trace(traces[ ,i], sample_interval)
  }
  df
}
