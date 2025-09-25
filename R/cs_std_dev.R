#' Calculate the corrected sample standard deviation
#' @param values numeric values
#' @return the corrected sample standard deviation
#' @author Richèl J.C. Bilderbeek
#' @encoding UTF-8
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
