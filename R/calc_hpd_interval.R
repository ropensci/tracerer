#' Calculate the Highest Probability Density
#' @param propertion the proportion of numbers within the interval.
#'   For example, use 0.95 for a 95% interval
#' @param trace a numeric vector of values
#' @author Richel J.C. Bilderbeek, after code by J. Heled
#' From https://github.com/beast-dev/beast-mcmc/blob/98705c59db65e4f406a420bbade949aeecfe05d0/src/dr/stats/DiscreteStatistics.java#L317
calc_hpd_interval <- function(trace, proportion = 0.95) {

  trace <- sort(trace)
  minRange <- Inf
  hpdIndex <- 0 + 1
  diff <- as.integer((proportion * length(trace)) + 0.5)

  for (i in seq(0 + 1, length(trace) - diff + 1)) {
    minValue <- trace[i]
    maxValue <- trace[i + diff - 1]
    range <- abs(maxValue - minValue)
    if (range < minRange) {
      minRange <- range;
      hpdIndex <- i;
    }
  }

  c(trace[hpdIndex], trace[hpdIndex + diff - 1])

}
