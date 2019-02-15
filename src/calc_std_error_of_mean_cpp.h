#ifndef CALC_STD_ERROR_OF_MEAN_CPP_H
#define CALC_STD_ERROR_OF_MEAN_CPP_H

#include <vector>

//' Calculates the standard error of the mean
//' @param sample numeric vector of values
//' @return the standard error of the mean
//' @author Richèl J.C. Bilderbeek
// [[Rcpp::export]]
double calc_std_error_of_mean_cpp(
  const std::vector<double>& sample
);

#endif // CALC_STD_ERROR_OF_MEAN_CPP_H


