#' Calculate the geometric mean
#' @param values a numeric vector of values
#' @return returns the geometrics mean if all values are at least zero,
#'   else returns NA
#' @author Richel J.C. Bilderbeek
calc_geom_mean <- function(values) {
  if (any(values < 0.0)) return(NA)
  exp(mean(log(values)))
}
