# Keep the next three lines for RCpp
#' @useDynLib tracerer
#' @importFrom Rcpp sourceCpp
NULL

#' Calculate the standard error of the mean
#' @param trace the values
#' @return the standard error of the mean
#' @export
#' @examples
#'   trace <- sin(seq(from = 0.0, to = 2.0 * pi, length.out = 100))
#'   stderr_mean <- calc_stderr_mean(trace)
#'   testthat::expect_equal(stderr_mean, expected = 0.4347425, tolerance = 0.01)
#' @seealso Java code can be found here: \url{https://github.com/beast-dev/beast-mcmc/blob/800817772033c13061f026226e41128d21fd14f3/src/dr/inference/trace/TraceCorrelation.java#L159} # nolint URLs can be long
#' @author The original Java version of the algorithm was from Remco Bouckaert,
#'   ported to R and adapted by Richèl J.C. Bilderbeek
calc_stderr_mean <- function(trace) {

  if (!is.numeric(trace)) {
    stop("'trace' must be numeric")
  }
  calc_std_error_of_mean_cpp(trace) # nolint internal function
}
