# tracerer

Branch|[![Travis CI logo](TravisCI.png)](https://travis-ci.org)|[![Codecov logo](Codecov.png)](https://www.codecov.io)
---|---|---
master|[![Build Status](https://travis-ci.org/richelbilderbeek/tracerer.svg?branch=master)](https://travis-ci.org/richelbilderbeek/tracerer)|[![codecov.io](https://codecov.io/github/richelbilderbeek/tracerer/coverage.svg?branch=master)](https://codecov.io/github/richelbilderbeek/tracerer/branch/master)
develop|[![Build Status](https://travis-ci.org/richelbilderbeek/tracerer.svg?branch=develop)](https://travis-ci.org/richelbilderbeek/tracerer)|[![codecov.io](https://codecov.io/github/richelbilderbeek/tracerer/coverage.svg?branch=develop)](https://codecov.io/github/richelbilderbeek/tracerer/branch/develop)

`tracerer`, 'Tracer for R' is an R package 
to work with BEAST2 output files. 

Use [beautier](https://github.com/richelbilderbeek/beautier) to create BEAST2 input (`.xml`) files.

Use [lumier](https://github.com/richelbilderbeek/lumier) to run BEAST2.

Use [BEASTmasteR](https://github.com/nmatzke/BEASTmasteR) for tip-dating analyses using fossils as dated terminal taxa.

Use [RBeast](https://github.com/beast-dev/RBeast) for other things.

## Example

```
library(tracerer)

# Obtain an example log file its name
filename <- get_path("beast2_example_output.log")

# Parse that log file
beast_log_full <- parse_beast_log(filename)

# Remove the burn-in
beast_log <- remove_burn_ins(
  beast_log_full,
  burn_in_fraction = 0.1
)

# Calculates the effective sample sizes of all parameter estimates
esses <- calc_esses(beast_log, sample_interval = 1000)
```

## Installation

Install `tracerer` in `R` using `devtools`:

```{r}
devtools::install_github("richelbilderbeek/tracerer")
```
