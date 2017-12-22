# beastier

Branch|[![Travis CI logo](TravisCI.png)](https://travis-ci.org)|[![Codecov logo](Codecov.png)](https://www.codecov.io)
---|---|---
master|[![Build Status](https://travis-ci.org/richelbilderbeek/beastier.svg?branch=master)](https://travis-ci.org/richelbilderbeek/beastier)|[![codecov.io](https://codecov.io/github/richelbilderbeek/beastier/coverage.svg?branch=master)](https://codecov.io/github/richelbilderbeek/beastier/branch/master)
develop|[![Build Status](https://travis-ci.org/richelbilderbeek/beastier.svg?branch=develop)](https://travis-ci.org/richelbilderbeek/beastier)|[![codecov.io](https://codecov.io/github/richelbilderbeek/beastier/coverage.svg?branch=develop)](https://codecov.io/github/richelbilderbeek/beastier/branch/develop)

R package for working with BEAST and BEAST2 output (`.log` and `.trees`) files. 

Use [beautier](https://github.com/richelbilderbeek/beautier) to generate BEAST2 input (`.xml`) files.

Use [RBeast](https://github.com/beast-dev/RBeast) for other things.

## Example

```
library(beastier)

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

To install `beastier` in `R`:

```{r}
install.packages("devtools")
devtools::install_github("richelbilderbeek/beastier")
```
