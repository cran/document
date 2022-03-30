if (interactive()) pkgload::load_all()
test_html <- function() {
    options(useFancyQuotes = FALSE)
    output_directory <- file.path(tempdir(), "document_runit_html")
    unlink(output_directory, recursive = TRUE)
    dir.create(output_directory)
    input <- file.path(system.file("files", package = "document"), "simple.R")
    output <- document(input, output_directory = output_directory,
                       check_package = FALSE, runit = TRUE)
    # html
    output_path <- output[["html_path"]]
    current <- readLines(output_path)
    ref_path <- file.path(system.file("expected_files", package = "document"),
                          sub("\\.R", ".html", basename(input)))
    reference  <- readLines(ref_path)
    if (fritools::is_running_on_fvafrcu_machines() ||
        fritools::is_running_on_gitlab_com()) {
        # html definition will change over time, 30% should be stable core html.
        RUnit::checkTrue(sum(reference %in% current) / length(current) >= 0.3)
    } else {
        # That's not true on CRAN, so we check on current being html at all:
        RUnit::checkTrue(any(grepl("a_first_function\\(df\\)", current)) &&
                         any(grepl("</html>$", current))
                         )
    }
}
