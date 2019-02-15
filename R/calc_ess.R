#' Calculates the Effective Sample Size
#' @param trace the values without burn-in
#' @param sample_interval the interval in timesteps between samples
#' @return the effective sample size
#' @examples
#'   filename <- get_tracerer_path("beast2_example_output.log")
#'
#'  # Parse the file as-is and conclude the sampling interval
#'  df <- parse_beast_log(filename)
#'  sample_interval <- df$Sample[2] - df$Sample[1] # nolint BEAST2 style
#'
#'  # Only keep the parameter estimates,
#'  # do not care about the sampling times anymore
#'  estimates <- subset(df, select = -Sample) # nolint BEAST2 style
#'
#'  esses <- rep(NA, ncol(estimates))
#'  burn_in_fraction <- 0.1
#'  for (i in seq_along(estimates)) {
#'    # Trace with the burn-in still present
#'    trace_raw <- as.numeric(t(estimates[i]))
#'
#'    # Trace with the burn-in removed
#'    trace <- remove_burn_in(
#'      trace = trace_raw,
#'      burn_in_fraction = 0.1
#'    )
#'
#'    # Store the effectice sample size
#'    esses[i] <- calc_ess(trace, sample_interval = sample_interval)
#'  }
#'
#'  # Use the values that TRACER shows
#'  expected_esses <- c(10, 10, 10, 10, 7, 10, 9, 6)
#'  testit::assert(all(expected_esses - esses < 0.5))
#' @export
#' @seealso Java code can be found here: \url{https://github.com/CompEvol/beast2/blob/9f040ed0357c4b946ea276a481a4c654ad4fff36/src/beast/core/util/ESS.java#L161} # nolint URLs can be long
#' @author The original Java version of the algorithm was from Remco Bouckaert,
#'   ported to R and adapted by Richèl J.C. Bilderbeek
calc_ess <- function(trace, sample_interval) {
  if (!is.numeric(trace)) {
    stop("trace must be numeric")
  }
  if (sample_interval < 1) {
    stop("sample interval must be at least one")
  }
  act <- tracerer::calc_act(
    trace = trace,
    sample_interval = sample_interval
  )
  ess <- length(trace) / (act / sample_interval)
  ess
}
