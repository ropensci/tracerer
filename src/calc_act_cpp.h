#ifndef CALC_ACT_CPP_H
#define CALC_ACT_CPP_H

#include <vector>

//' Calculate the auto correlation time
//' from \url{https://github.com/beast-dev/beast-mcmc/blob/800817772033c13061f026226e41128d21fd14f3/src/dr/inference/trace/TraceCorrelation.java#L159} # nolint
//' @param sample sample
//' @param sample_interval sample interval
//' @return the auto correlation time
//' @author Richèl J.C. Bilderbeek
// [[Rcpp::export]]
double calc_act_cpp(const std::vector<double>& sample, const int sample_interval);

#endif // CALC_ACT_CPP_H


