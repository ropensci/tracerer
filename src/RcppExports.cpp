// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

// calc_act_cpp
double calc_act_cpp(const std::vector<double>& sample, const int sample_interval);
RcppExport SEXP _beastier_calc_act_cpp(SEXP sampleSEXP, SEXP sample_intervalSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const std::vector<double>& >::type sample(sampleSEXP);
    Rcpp::traits::input_parameter< const int >::type sample_interval(sample_intervalSEXP);
    rcpp_result_gen = Rcpp::wrap(calc_act_cpp(sample, sample_interval));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_beastier_calc_act_cpp", (DL_FUNC) &_beastier_calc_act_cpp, 2},
    {NULL, NULL, 0}
};

RcppExport void R_init_beastier(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}