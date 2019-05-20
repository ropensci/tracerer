#' Count the number of trees in a \code{.trees} file
#' @inheritParams default_params_doc
#' @return the number of trees
#' @seealso if the \code{.trees} file is invalid,
#'   use \link{is_trees_file} with \code{verbose = TRUE}
#'   for the reason
#' @author Richèl J.C. Bilderbeek
#' @export
count_trees_in_file <- function(
  trees_filename
) {
  if (!file.exists(trees_filename)) {
    stop(
      "'trees_filename' absent.\n",
      "File '", trees_filename, "' not found"
    )
  }
  if (!is_trees_file(trees_filename = trees_filename)) {
    stop(
      "'trees_filename' invalid"
    )
  }
  sum(stringr::str_count(
    string = readLines(trees_filename ,warn = FALSE),
    pattern = "(^tree STATE_)|(\tTREE \\* UNTITLED = \\[&R\\] \\()")
  )
}
