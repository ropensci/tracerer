#' Calculate the geometric mean
calc_geom_mean <- function(values) {
  exp(mean(log(values)))
}
