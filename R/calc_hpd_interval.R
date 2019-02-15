#' Calculate the Highest Probability Density of an MCMC trace that
#'   has its burn-in removed
#' @param proportion the proportion of numbers within the interval.
#'   For example, use 0.95 for a 95 percentage interval
#' @param trace a numeric vector of parameter estimates obtained from
#'   an MCMC run. Must have its burn-in removed
#' @return a numeric vector, with at index 1 the lower boundary of the
#'   interval, and at index 2 the upper boundary of the interval
#' @seealso
#'   The function \code{\link{remove_burn_in}} removes
#'   a burn-in.
#'   The Java code that inspired this function can be found here:
#'   \url{https://github.com/beast-dev/beast-mcmc/blob/98705c59db65e4f406a420bbade949aeecfe05d0/src/dr/stats/DiscreteStatistics.java#L317} # nolint URLs can be long
#' @author The original Java version of the algorithm was from J. Heled,
#'   ported to R and adapted by Richèl J.C. Bilderbeek
#' @examples
#'   estimates <- parse_beast_log(get_tracerer_path("beast2_example_output.log"))
#'   tree_height_trace <- remove_burn_in(
#'     estimates$TreeHeight,
#'     burn_in_fraction = 0.1
#'   )
#'
#'   hpd_interval <- calc_hpd_interval(tree_height_trace, proportion = 0.95)
#'   testthat::expect_equivalent(0.453, hpd_interval[1], tolerance = 0.01)
#'   testthat::expect_equivalent(1.816, hpd_interval[2], tolerance = 0.01)
#' @export
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
