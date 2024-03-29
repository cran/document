#!/usr/bin/Rscript --vanilla
#' \emph{File} simple.R
#'
#' Provide a simple example of a file using roxygen and standard R comments.
#'
#' @note This header will show up in the documentation, but it's got nothing to
#' do with the R statements below. Usually this is not intended.
#' @section Warning: DO NOT CHANGE THE FOLLWOWING THREE LINES.
#' @docType data
#' @name A Header for
NULL
# ROXYGEN_STOP

#% Front Matter
##% load packages
library("methods") # load an example package from the standard library


##% load local code
# This would usually be functions defined and stored away in files.

##% define local functions
# ROXYGEN_START

#' a first function example XXX
#'
#' This really is just an example, the function prints \code{utils::head()} and
#' \code{utils::str()} of the given \code{data.frame}.
#' @param df Name of a data.frame to ... do whatever needs to be done.
#' @return NULL. This is no good.
#' @export
#' @examples
#' data(iris, package = "datasets")
#' a_first_function(iris)
a_first_function <- function(df) {
    message(paste("# Structure of", deparse(substitute(df)), ":"))
    utils::str(df)
    message(paste("# Head of", deparse(substitute(df)), ":"))
    print(utils::head(df))
    return(invisible(NULL))
}
# ROXYGEN_STOP

##% set "global" options
options(warn = 1)

#% Body Matter
##% Load data
data(iris, package = "datasets")

##% Analysize the data
a_first_function(iris)

#% Back Matter
