# tracerer

[![Peer Review Status](https://badges.ropensci.org/209_status.svg)](https://github.com/ropensci/onboarding/issues/209)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/tracerer)](https://cran.r-project.org/package=tracerer)
[![](http://cranlogs.r-pkg.org/badges/grand-total/tracerer)]( https://CRAN.R-project.org/package=tracerer)
[![](http://cranlogs.r-pkg.org/badges/tracerer)](https://CRAN.R-project.org/package=tracerer)
[![DOI](https://zenodo.org/badge/114987588.svg)](https://zenodo.org/badge/latestdoi/114987588)

Branch   |[![GitHub Actions logo](man/figures/GitHubActions.png)](https://github.com/ropensci/tracerer/actions)|[![Travis CI logo](man/figures/TravisCI.png)](https://travis-ci.com)                                                  |[![Codecov logo](man/figures/Codecov.png)](https://www.codecov.io)
---------|-----------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------
`master` |![R-CMD-check](https://github.com/ropensci/tracerer/workflows/R-CMD-check/badge.svg?branch=master)   |[![Build Status](https://travis-ci.com/ropensci/tracerer.svg?branch=master)](https://travis-ci.com/ropensci/tracerer) |[![codecov.io](https://codecov.io/github/ropensci/tracerer/coverage.svg?branch=master)](https://codecov.io/github/ropensci/tracerer/branch/master)
`develop`|![R-CMD-check](https://github.com/ropensci/tracerer/workflows/R-CMD-check/badge.svg?branch=develop)  |[![Build Status](https://travis-ci.com/ropensci/tracerer.svg?branch=develop)](https://travis-ci.com/ropensci/tracerer)|[![codecov.io](https://codecov.io/github/ropensci/tracerer/coverage.svg?branch=develop)](https://codecov.io/github/ropensci/tracerer/branch/develop)

`tracerer`, 'Tracer for R' is an R package to work with BEAST2 output files. 

![tracerer logo](man/figures/tracerer_logo.png)

`tracerer` is part of the [`babette`](https://github.com/ropensci/babette) package suite:

 * [`beautier`](https://github.com/ropensci/beautier) creates BEAST2 input (`.xml`) files.
 * [`beastier`](https://github.com/ropensci/beastier) runs BEAST2
 * [`mauricer`](https://github.com/ropensci/mauricer): install BEAST2 packages
 * [`tracerer`](https://github.com/ropensci/tracerer) pastes BEAST2 output (`.log`, `.trees`, etc) files.

Related R packages:

 * [`lumier`](https://github.com/ropensci/lumier): Shiny app to help create the function call needed
 * [`BEASTmasteR`](https://github.com/nmatzke/BEASTmasteR): tip-dating using fossils as dated terminal taxa
 * [`RBeast`](https://github.com/beast-dev/RBeast): misc other things
 * [`tracerer_on_windows`](https://github.com/richelbilderbeek/tracerer_on_windows): verifies `tracerer` builds on Windows

## Example

```{r}
library(tracerer)

# Obtain an example log file its name
filename <- get_tracerer_path("beast2_example_output.log")

# Parse that log file
beast_log_full <- parse_beast_tracelog_file(filename)

# Remove the burn-in
beast_log <- remove_burn_ins(
  beast_log_full,
  burn_in_fraction = 0.1
)

# Calculates the effective sample sizes of all parameter estimates
esses <- calc_esses(beast_log, sample_interval = 1000)
```

## Installation

You can install:

 * (recommended) The CRAN version
 * The stable development version
 * The bleeding edge development version

### CRAN

`tracerer` is on CRAN:

```{r}
install.packages("tracerer")
```

### Stable development version

Install the `tracerer` `master` branch using `remotes`:

```{r}
remotes::install_github("ropensci/tracerer")
```

### Bleeding edge development version

Install the `tracerer` `develop` branch using `remotes`:

```{r}
remotes::install_github("ropensci/tracerer", ref = "develop")
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

 * Bilderbeek, Richèl JC, and Rampal S. Etienne. "`babette`: BEAUti 2, BEAST 2 and Tracer for R." Methods in Ecology and Evolution (2018). https://doi.org/10.1111/2041-210X.13032

FASTA files `anthus_aco.fas` and `anthus_nd2.fas` from:
 
 * Van Els, Paul, and Heraldo V. Norambuena. "A revision of species limits in Neotropical pipits Anthus based on multilocus genetic and vocal data." Ibis.

[![ropensci_footer](https://ropensci.org/public_images/ropensci_footer.png)](https://ropensci.org)
