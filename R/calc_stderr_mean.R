#' wevgowe
calc_stderr_mean <- function(traces) {

  # From https://github.com/beast-dev/beast-mcmc/blob/800817772033c13061f026226e41128d21fd14f3/src/dr/inference/trace/TraceCorrelation.java#L159 # nolint
  # stderr_mean = sqrt(varStat / samples)
  # varStat -

  sqrt(var(traces) / length(traces))
}
