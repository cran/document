if (fritools::get_run_r_tests()) {
    library(testthat)
    if (interactive()) {
        pkgload::load_all()
    } else {
        library("document")
    }

    probably_winbuilder <- function() {
        # See file fixme_test_check.txt
        r <- identical(.Platform[["OS.type"]], "windows")
        return(r)
    }

    glbt <- fritools::get_lines_between_tags

    context("checking the package")
    context("not stopping on errors")
    test_that("warning on bug, not as cran", {
                  options(useFancyQuotes = FALSE)
                  file_name  <- file.path(system.file("files",
                                                      package = "document"),
                                          "produce_warning.R")
                  if (! probably_winbuilder())
                      expect_warning(
                                     document(file_name, check_package = TRUE,
                                              runit = TRUE,
                                              stop_on_check_not_passing = FALSE,
                                              check_as_cran = TRUE)
                                     )
}
    )
    test_that("warning on bug, as cran", {
                  options(useFancyQuotes = FALSE)
                  file_name  <- file.path(system.file("files",
                                                      package = "document"),
                                          "produce_warning.R")
                  if (! probably_winbuilder())
                      expect_warning(
                                     document(file_name, check_package = TRUE,
                                              runit = TRUE,
                                              stop_on_check_not_passing = FALSE,
                                              check_as_cran = FALSE)
                                     )
    }
    )
    context("stopping on errors")
    test_that("warning on bug, not as cran", {
                  options(useFancyQuotes = FALSE)
                  file_name  <- file.path(system.file("files",
                                                      package = "document"),
                                          "produce_warning.R")
                  if (! probably_winbuilder())
                      expect_warning(
                                     document(file_name, check_package = TRUE,
                                              runit = TRUE,
                                              stop_on_check_not_passing = TRUE,
                                              check_as_cran = TRUE)
                                     )
    }
    )
    test_that("warning on bug, as cran", {
                  options(useFancyQuotes = FALSE)
                  file_name  <- file.path(system.file("files",
                                                      package = "document"),
                                          "produce_warning.R")
                  if (! probably_winbuilder()) {
                      result <- document(file_name, check_package = TRUE,
                                         runit = TRUE,
                                         stop_on_check_not_passing = TRUE,
                                         check_as_cran = FALSE)
                      expectation <- c(errors = FALSE, warnings = TRUE,
                                       notes = FALSE)
                      testthat::expect_identical(checks(result$check_result),
                                                 expectation)
                  }
    })
}
