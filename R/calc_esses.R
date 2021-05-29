#' Calculates the Effective Sample Sizes from a parsed BEAST2 log file
#' @param traces a dataframe with traces with removed burn-in
#' @param sample_interval the interval in timesteps between samples
#' @return the effective sample sizes
#' @examples
#' # Parse an example log file
#' estimates <- parse_beast_tracelog_file(
#'   get_tracerer_path("beast2_example_output.log")
#' )
#'
#' # Calculate the effective sample sizes of all parameter estimates
#' calc_esses(estimates, sample_interval = 1000)
#' @export
#' @author Richèl J.C. Bilderbeek
calc_esses <- function(
  traces,
  sample_interval
) {

  if (!is.data.frame(traces)) {
    stop("traces must be a data.frame")
  }
  if (sample_interval < 1) {
    stop("sample interval must be at least one")
  }

  # Remove warning: no visible binding for global variable 'Sample'
  Sample <- NULL; rm(Sample) # nolint use uppercase variable name just like BEAST2
  # Remove the Sample column from the dataframe
  traces <- subset(traces, select = -c(Sample )) # nolint use uppercase variable name just like BEAST2

  esses <- rep(NA, ncol(traces))

  for (i in seq_along(traces)) {
    trace <- as.numeric(t(traces[i]))
    esses[i] <- tracerer::calc_ess(
      trace, sample_interval = sample_interval
    )
  }

  df <- traces[1, ]
  df[1, ] <- esses
  testit::assert(nrow(df) == 1)
  testit::assert(names(df) == names(traces))

  # Round off values to nearest integers
  df[1, ] <- as.integer(as.numeric(df[1, ]) + 0.5)

  df
}
