#' Measure if a file a valid BEAST2 \code{.trees} file
#' @inheritParams default_params_doc
#' @return TRUE if \code{trees_filename} is a valid \code{.trees} file
#' @export
#' @examples
#'   trees_filename <- get_tracerer_path("beast2_example_output.trees")
#'   posterior <- parse_beast_trees(trees_filename)
#'   testit::assert(is_trees_posterior(posterior))
#' @seealso
#'   Most of the work is done by \link[ape]{read.nexus}
#' @examples
#' library(testthat)
#'
#' expect_true(is_trees_file(get_tracerer_path("beast2_example_output.trees")))
#' expect_true(is_trees_file(get_tracerer_path("unplottable_anthus_aco.trees")))
#' expect_true(is_trees_file(get_tracerer_path("anthus_2_4_a.trees")))
#' expect_true(is_trees_file(get_tracerer_path("anthus_2_4_b.trees")))
#' expect_false(is_trees_file(get_tracerer_path("mcbette_issue_8.trees")))
#' @author Richèl J.C. Bilderbeek
is_trees_file <- function(
  trees_filename,
  verbose = FALSE
) {
  if (!file.exists(trees_filename)) {
    stop(
      "'trees_filename' is the name of an absent file. ",
      "Filename '", trees_filename, "' not found"
    )
  }

  # Do not warn about 'incomplete final line found on ...'
  lines <- readLines(trees_filename, warn = FALSE)
  last_line <- lines[length(lines)]
  # BEAST2 saves as 'End;', where ape saves as 'END;'
  if (last_line != "End;" && last_line != "END;") {
    if (verbose) {
        message("last line should be 'End;'")
    }
    return(FALSE)
  }

  is_valid <- FALSE

  tryCatch({
      # Cannot use ape::read.tree, as that's incompatible with BEAST2's output
      ape::read.nexus(trees_filename)
      is_valid <- TRUE
    },
    error = function(e) {
      if (verbose) {
        message("Error message: ", e$message)
      }
    }
  )
  is_valid
}
