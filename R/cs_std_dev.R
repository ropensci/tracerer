#' Corrected Sample standard deviation
#' @param values numeric values
#' @author Richel J.C. Bilderbeek
#' @export
cs_std_dev <- function(values) {

  mean <- mean(values)

  # Errors
  es <- values - mean

  # Squared Errors
  ses <- es * es

  # Sum of Squared Errors
  sses <- sum(ses)

  n <- length(values)
  f <- 1.0 / (n - 1.0)

  s <- sqrt(f * sses)
  s
}
