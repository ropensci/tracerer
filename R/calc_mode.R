#' Calculate the mode of values
#' If the distribution is bi or multimodal or uniform, NA is returned
#' @param values numeric vector to calculate the mode of
#' @return the mode of the trace
#' @author Richèl J.C. Bilderbeek
#' @examples
#' # In a unimodal distribution, find the value that occurs most
#' calc_mode(c(1, 2, 2))
#' calc_mode(c(1, 1, 2))
#'
#' # For a uniform distribution, NA is returned
#' tracerer:::calc_mode(c(1, 2))
#' @export
calc_mode <- function(values) {
  unique_values <- unique(values)
  occurrances <- tabulate(match(values, unique_values))
  max_occarance <- occurrances[which.max(occurrances)]
  n_max_occurring <- sum(max_occarance == occurrances)
  if (n_max_occurring != 1) return(NA)
  unique_values[which.max(tabulate(match(values, unique_values)))]
}
