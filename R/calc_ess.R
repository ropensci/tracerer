#' Calculates the Effective Sample Size
#' @inheritParams default_params_doc
#' @param trace the values without burn-in
#' @return the effective sample size
#' @examples
#' filename <- get_tracerer_path("beast2_example_output.log")
#' estimates <- parse_beast_tracelog_file(filename)
#' calc_ess(estimates$posterior, sample_interval = 1000)
#' @export
#' @seealso Java code can be found here: \url{https://github.com/CompEvol/beast2/blob/9f040ed0357c4b946ea276a481a4c654ad4fff36/src/beast/core/util/ESS.java#L161} # nolint URLs can be long
#' @author The original Java version of the algorithm was from Remco Bouckaert,
#'   ported to R and adapted by Richèl J.C. Bilderbeek
calc_ess <- function(trace, sample_interval) {
  tracerer::check_trace(trace)
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
