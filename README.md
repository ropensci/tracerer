# tracerer

[![Peer Review Status](https://badges.ropensci.org/209_status.svg)](https://github.com/ropensci/onboarding/issues/209)

Branch|[![Travis CI logo](pics/TravisCI.png)](https://travis-ci.org)|[![AppVeyor logo](pics/AppVeyor.png)](https://www.appveyor.com)|[![Codecov logo](pics/Codecov.png)](https://www.codecov.io)
---|---|---|---
master|[![Build Status](https://travis-ci.org/ropensci/tracerer.svg?branch=master)](https://travis-ci.org/ropensci/tracerer)|[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/ropensci/tracerer?branch=master&svg=true)](https://ci.appveyor.com/project/ropensci/tracerer)|[![codecov.io](https://codecov.io/github/ropensci/tracerer/coverage.svg?branch=master)](https://codecov.io/github/ropensci/tracerer/branch/master)
develop|[![Build Status](https://travis-ci.org/ropensci/tracerer.svg?branch=develop)](https://travis-ci.org/ropensci/tracerer)|[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/ropensci/tracerer?branch=develop&svg=true)](https://ci.appveyor.com/project/ropensci/tracerer)|[![codecov.io](https://codecov.io/github/ropensci/tracerer/coverage.svg?branch=develop)](https://codecov.io/github/ropensci/tracerer/branch/develop)

[![DOI](https://zenodo.org/badge/114987588.svg)](https://zenodo.org/badge/latestdoi/114987588)

`tracerer`, 'Tracer for R' is an R package 
to work with BEAST2 output files. 

![tracerer logo](pics/tracerer_logo.png)

`tracerer` is part of the [babette](https://github.com/ropensci/babette) package suite:

 * [beautier](https://github.com/ropensci/beautier) creates BEAST2 input (`.xml`) files.
 * [beastier](https://github.com/ropensci/beastier) runs BEAST2
 * [tracerer](https://github.com/ropensci/tracerer) pastes BEAST2 output (`.log`, `.trees`, etc) files.

Related R packages:

 * [lumier](https://github.com/ropensci/lumier): Shiny app to help create the function call needed
 * [mauricer](https://github.com/ropensci/mauricer): install BEAST2 packages
 * [BEASTmasteR](https://github.com/nmatzke/BEASTmasteR): tip-dating using fossils as dated terminal taxa
 * [RBeast](https://github.com/beast-dev/RBeast): misc other things

## Example

```{r}
library(tracerer)

# Obtain an example log file its name
filename <- get_tracerer_path("beast2_example_output.log")

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
devtools::install_github("ropensci/tracerer")
```

## FAQ

See [FAQ](faq.md)

## There is a feature I miss

See [CONTRIBUTING](CONTRIBUTING.md), at `Submitting use cases`

## I want to collaborate

See [CONTRIBUTING](CONTRIBUTING.md), at 'Submitting code'

## I think I have found a bug

See [CONTRIBUTING](CONTRIBUTING.md), at 'Submitting bugs' 

## There's something else I want to say

Sure, just add an Issue. Or send an email.

## External links

 * [BEAST2 GitHub repository](https://github.com/CompEvol/beast2)
 * [Tracer GitHub repository](https://github.com/beast-dev/tracer)

## References

Article about `babette`:

 * Bilderbeek, Richel JC, and Rampal S. Etienne. "babette: BEAUti 2, BEAST 2 and Tracer for R." Methods in Ecology and Evolution (2018). https://doi.org/10.1111/2041-210X.13032

FASTA files `anthus_aco.fas` and `anthus_nd2.fas` from:
 
 * Van Els, Paul, and Heraldo V. Norambuena. "A revision of species limits in Neotropical pipits Anthus based on multilocus genetic and vocal data." Ibis.

[![ropensci_footer](https://ropensci.org/public_images/ropensci_footer.png)](https://ropensci.org)
