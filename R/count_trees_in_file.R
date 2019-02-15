#' Count the number of trees in a \code{.trees} file
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
count_trees_in_file <- function(trees_filename) {
  if (!file.exists(trees_filename)) {
    stop(
      "'trees_filename' absent.\n",
      "File '", trees_filename, "' not found"
    )
  }
  sum(stringr::str_count(
    string = readLines(trees_filename ,warn = FALSE),
    pattern = "(^tree STATE_)|(\tTREE \\* UNTITLED = \\[&R\\] \\()")
  )
}
