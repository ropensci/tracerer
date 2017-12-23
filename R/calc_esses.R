#' Calculates the Effective Sample Sizes from a parsed BEAST2 log file
#' @param traces a dataframe with traces with removed burn-in
#' @param sample_interval the interval in timesteps between samples
#' @return the effective sample sizes
#' @examples
#'
#'   # Obtain an example log file its name
#'   filename <- get_path("beast2_example_output.log")
#'
#'   # Parse that log file
#'   beast_log_full <- parse_beast_log(filename = filename)
#'
#'   # Remove the burn-in
#'   beast_log <- remove_burn_ins(
#'     beast_log_full,
#'     burn_in_fraction = 0.1
#'   )
#'
#'   # Calculates the effective sample sizes of all parameter estimates
#'   esses <- calc_esses(beast_log, sample_interval = 1000)
#'
#'   # Round off values to nearest integers
#'   esses <- as.integer(esses[1, ] + 0.5)
#'   expected <- c(10, 10, 10, 10, 7, 10, 9, 6)
#'   testit::assert(all(esses == expected))
#'
#' @export
#' @author Richel Bilderbeek
calc_esses <- function(traces, sample_interval) {
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
    esses[i] <- beastier::calc_ess(
      trace, sample_interval = sample_interval
    )
  }

  df <- traces[1, ]
  df[1, ] <- esses
  testit::assert(nrow(df) == 1)
  testit::assert(names(df) == names(traces))
  df
}