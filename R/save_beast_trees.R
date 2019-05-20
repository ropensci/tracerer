#' Save the BEAST2 trees as a BEAST2 \code{.log} file.
#' There will be some differences: a BEAST2 \code{.log} file also saves
#' the model as comments and formats the numbers in a way non-standard to R
#' @param trees BEAST2 posterior trees, of type \code{ape::multiPhylo}
#' @param filename name of the \code{.trees} file to save to
#' @return nothing
#' @seealso Use \code{\link{parse_beast_log}} to read a BEAST2 \code{.log} file
#' @author Richèl J.C. Bilderbeek
#' @export
save_beast_trees <- function(
  trees,
  filename
) {
  if (class(trees) != "multiPhylo") {
    stop(
      "'trees' must be of class 'multiPhylo' instead of '", class(trees) , "'"
    )
  }
  if (!is.character(filename) || stringr::str_length(filename) == 0) {
    stop("'filename' must have at least one character")
  }
  ape::write.nexus(phy = trees, file = filename)

  testit::assert(is_trees_file(filename))
}
