#' Parses a BEAST2 .trees output file
#' @param filename name of the BEAST2 .trees output file
#' @return the phylogenies in the posterior
#' @export
#' @examples
#'   trees_filename <- get_tracerer_path("beast2_example_output.trees")
#'   posterior <- parse_beast_trees(trees_filename)
#'   testit::assert(is_trees_posterior(posterior))
#' @seealso
#'   Use \code{\link{save_beast_trees}} to save the phylogenies
#'   to a \code{.trees} file.
#'   Use \link{is_trees_file} with \code{verbose = TRUE} to find out
#'   why a file is invalid
#' @author Richèl J.C. Bilderbeek
parse_beast_trees <- function(
  filename
) {
  if (!file.exists(filename)) {
    stop(
      "'filename' is the name of an absent file. ",
      "Filename '", filename, "' not found"
    )
  }

  # Do not warn about 'incomplete final line found on ...'
  lines <- readLines(filename, warn = FALSE)
  last_line <- lines[length(lines)]
  # BEAST2 saves as 'End;', where ape saves as 'END;'
  if (last_line != "End;" && last_line != "END;") {
    stop(
      "Expect 'End;' (BEAST2) or 'END;' (ape::write.nexus) at the ",
      "end of .trees file. \n",
      "Actual value: '", last_line, "'. \n",
      "Filename: '", filename, "'"
    )
  }

  trees <- tryCatch({
      # Cannot use ape::read.tree, as that's incompatible with BEAST2's output
      # Do not use force.multi, as STATE_ will be lost
      ape::read.nexus(filename)
    },
    error = function(e) {
      stop(
        "invalid file '", filename, "' \n",
        "error message: ", e$message
      )
    }
  )

  testit::assert(is_trees_file(filename)) # nolint tracerer function
  testit::assert(length(trees) != 1 || !is.na(trees))


  class(trees) <- "multiPhylo"
  # Use c to strip the state names and convert it to a pure multiPhylo
  trees <- c(trees)

  # Check if it matches the file
  n_trees_in_file <- tracerer::count_trees_in_file(filename)
  n_trees_in_output <- length(trees)
  testthat::expect_equal(n_trees_in_file, n_trees_in_output)

  trees
}
