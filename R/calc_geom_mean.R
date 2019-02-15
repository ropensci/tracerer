#' Calculate the geometric mean
#' @param values a numeric vector of values
#' @return returns the geometric mean if all values are at least zero,
#'   else returns NA
#' @author Richèl J.C. Bilderbeek
#' @noRd
calc_geom_mean <- function(values) {
  if (any(values < 0.0)) return(NA)
  exp(mean(log(values)))
}
