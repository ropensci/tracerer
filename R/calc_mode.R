#' Calculate the mode of values
#' If the disribution is bi or multimodal or uniform, the first value
#' with the highest occurrance is taken
#' @param values numeric vector to calculate the mode of
#' @author Richel J.C. Bilderbeek
#' @examples
#'   # In a unimodel distribution, find the value that occurs most
#'   testit::assert(tracerer:::calc_mode(c(1, 2, 2)) == 2)
#'   testit::assert(tracerer:::calc_mode(c(1, 1, 2)) == 1)
#'
#'   # For a uniform distribution, take the first value that occurs most
#'   testit::assert(tracerer:::calc_mode(c(1, 2)) == 1)
#'   testit::assert(tracerer:::calc_mode(c(2, 1)) == 2)
calc_mode <- function(values) {
  unique_values <- unique(values)
  unique_values[which.max(tabulate(match(values, unique_values)))]
}
