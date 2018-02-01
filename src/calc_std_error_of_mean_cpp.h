#ifndef CALC_STD_ERROR_OF_MEAN_CPP_H
#define CALC_STD_ERROR_OF_MEAN_CPP_H

#include <vector>

//' Calculates the standard error of the mean
//' @param sample sample
//' @param sample_interval sample interval
//' @return the standard error of the mean
// [[Rcpp::export]]
double calc_std_error_of_mean_cpp(
  const std::vector<double>& sample,
  const int sample_interval
);

#endif // CALC_STD_ERROR_OF_MEAN_CPP_H


