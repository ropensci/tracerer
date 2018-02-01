#' Calculate the Highest Probability Density
#' @param proportion the proportion of numbers within the interval.
#'   For example, use 0.95 for a 95 percentage interval
#' @param trace a numeric vector of values
#' @return a numeric vector, with at index 1 the lower boundary of the
#'   interval, and at index 2 the upper boundary of the interval
#' @seealso Java code can be found here: \url{https://github.com/beast-dev/beast-mcmc/blob/98705c59db65e4f406a420bbade949aeecfe05d0/src/dr/stats/DiscreteStatistics.java#L317} # nolint URLs can be long
#' @author The original Java version of the algorithm was from J. Heled,
#'   ported to R and adapted by Richel J.C. Bilderbeek
calc_hpd_interval <- function(trace, proportion = 0.95) {

  trace <- sort(trace)
  min_range <- Inf
  hpd_index <- 0 + 1
  diff <- as.integer((proportion * length(trace)) + 0.5)

  for (i in seq(0 + 1, length(trace) - diff + 1)) {
    min_value <- trace[i]
    max_value <- trace[i + diff - 1]
    range <- abs(max_value - min_value)
    if (range < min_range) {
      min_range <- range
      hpd_index <- i
    }
  }

  c(trace[hpd_index], trace[hpd_index + diff - 1])

}
