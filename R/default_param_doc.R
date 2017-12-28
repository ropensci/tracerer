#' This function does nothing. It is intended to inherit is parameters'
#' documentation.
#' @param crown_age the crown age of the phylogeny
#' @param crown_ages the crown ages of the phylogenies. Set to NA
#'   if the crown age needs to be estimated
#' @param fasta_filename a FASTA filename.
#'   Use \code{\link{get_fasta_filename}} to obtain a testing FASTA filename.
#' @param fasta_filenames One or more FASTA filenames.
#'   Use \code{\link{get_fasta_filename}} to obtain a testing FASTA filename.
#' @param fixed_crown_age determines if the phylogeny's crown age is
#'   fixed. If FALSE, crown age is estimated by BEAST2. If TRUE,
#'   the crown age is fixed to the crown age
#'   of the initial phylogeny.
#' @param fixed_crown_ages one or more booleans to determine if the
#'   phylogenies' crown ages are fixed.
#'   If FALSE, crown age is estimated by BEAST2. If TRUE,
#'   the crown age is fixed to the crown age
#'   of the initial phylogeny.
#' @param initial_phylogenies one or more MCMC chain's initial phylogenies.
#'   Each one set to NA will result in BEAST2 using a random phylogeny. Else
#'   the phylogeny is assumed to be of class ape::phylo.
#' @param input_fasta_filenames One or more FASTA filenames.
#'   Use \code{\link{get_fasta_filename}} to obtain a testing FASTA filename.
#' @param output_xml_filename Name of the XML parameter file created by this
#'   function. BEAST2 uses this file as input.
#' @param sequence_length a DNA sequence length, in base pairs
#' @param verbose if TRUE, additional information is displayed, that
#'   is potentially useful in debugging
#' @author Richel J.C. Bilderbeek
default_params_doc <- function(
  clock_model, clock_models,
  crown_age, crown_ages,
  fasta_filename, fasta_filenames,
  fixed_crown_age,
  fixed_crown_ages,
  initial_phylogenies,
  input_fasta_filenames,
  mcmc,
  misc_options,
  output_xml_filename,
  sequence_length,
  site_model, site_models,
  tree_prior, tree_priors,
  verbose
) {
  # Nothing
}
