## ----comment = ""-------------------------------------------------------------
path <- system.file("files", "minimal.R", package = "document")
cat(readLines(path), sep = "\n")

## ----result = "hide", message = FALSE-----------------------------------------
d <- document::document(file_name = path, check_package = FALSE)

## ----comment = ""-------------------------------------------------------------
cat(readLines(d[["txt_path"]]), sep = "\n")

## ----comment = ""-------------------------------------------------------------
path <- system.file("files", "simple.R", package = "document")
cat(readLines(path), sep = "\n")

## ----result = "hide", message = FALSE-----------------------------------------
d <- document::document(file_name = path, check_package = FALSE)

## ----comment = ""-------------------------------------------------------------
cat(readLines(d[["txt_path"]]), sep = "\n")

## ----echo = FALSE-------------------------------------------------------------
# owing to Dason Kurkiewicz <dasonk@gmail.com>,
# https://github.com/Dasonk/docstring
# This is only needed for the vignette, you can skip the setting of the option
# in regular use.
pager_function <- function(x, ...) {
    x <- readLines(x)
    x <- gsub("_", "", x)
    cat(paste(x, collapse = "\n"), "\n")
}
options(pager = pager_function)

## ----comment = "", message = FALSE, warning = FALSE---------------------------
path <- system.file("files", "minimal.R", package = "document")
document::man(x = path, topic = "foo")

