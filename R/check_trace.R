#' Check if the trace is a valid. Will \link{stop} if not
#' @inheritParams default_params_doc
#' @export
#' @author Richèl J.C. Bilderbeek
#' @examples
#' check_trace(seq(1, 2))
check_trace <- function(trace) {
  if (!is.numeric(trace)) {
    stop("'trace' must be numeric")
  }
}
