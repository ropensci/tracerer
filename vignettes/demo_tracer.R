## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(tracerer)

## ------------------------------------------------------------------------
estimates <- parse_beast_log(get_path("beast2_example_output.log"))
esses <- calc_esses(estimates, sample_interval = 1000, burn_in_fraction = 0.1)
table <- t(esses)
colnames(table) <- c("ESS")
knitr::kable(table)

## ------------------------------------------------------------------------
sum_stats <- calc_sum_stats(estimates$posterior, sample_interval = 1000, burn_in_fraction = 0.1)
knitr::kable(sum_stats)

## ------------------------------------------------------------------------
ggplot2::ggplot(
  data = remove_burn_ins(estimates, burn_in_fraction = 0.1),
  ggplot2::aes(posterior) 
) + ggplot2::geom_histogram(binwidth = 0.21) + ggplot2::scale_x_continuous(breaks = seq(-75,-68))


