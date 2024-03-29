% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/document.R
\name{document}
\alias{document}
\title{Document (Chunks of) an R Code File}
\usage{
document(
  file_name,
  working_directory = NULL,
  output_directory = tempdir(),
  dependencies = NULL,
  sanitize_Rd = TRUE,
  runit = FALSE,
  check_package = TRUE,
  check_as_cran = check_package,
  stop_on_check_not_passing = check_package,
  clean = FALSE,
  debug = TRUE,
  ...
)
}
\arguments{
\item{file_name}{The name of the R code file to be documented.}

\item{working_directory}{A working directory. Keep the default.}

\item{output_directory}{The directory to put the documentation into. You
might want to use \code{\link[base]{dirname}(file_name)}.}

\item{dependencies}{A character vector of package names the functions depend
on.}

\item{sanitize_Rd}{Remove strange characters from \code{Rdconv}?}

\item{runit}{Convert the text received from the help files if running
\pkg{RUnit}?
Do not bother, this is for Unit testing only.}

\item{check_package}{Run \command{R CMD check} the sources? See
\bold{Note} below.}

\item{check_as_cran}{Use the \command{--as-cran} flag with
\command{R CMD check}?}

\item{stop_on_check_not_passing}{Stop if \command{R CMD check} does not pass?}

\item{clean}{Delete the working directory?}

\item{debug}{For internal use only: Summarize errors for \command{travis}?}

\item{...}{Arguments passed to
\code{\link[fritools:get_lines_between_tags]{get_lines_between_tags}}.}
}
\value{
A list containing
\describe{
    \item{pdf_path}{The path to the pdf file produced,}
    \item{txt_path}{The path to the text file produced,}
    \item{html_path}{The path to the html file produced,}
    \item{check_result}{The return value of
    \code{\link[rcmdcheck:rcmdcheck]{rcmdcheck::rcmdcheck()}}}
}
}
\description{
Document (Chunks of) an R Code File
}
\note{
One of the main features of \command{R CMD check} is checking for
code/documentation mismatches (it behaves pretty much like
\command{doxygen}).
No build system can check whether your documentation is useful, but
\command{R CMD check}
checks if it is formally matching your code. This check is the basic
idea behind \pkg{document}. The possibility to disable the
\command{R CMD check} is
there to disable CPU consuming checks while testing the package. Stick with
the default!
And do not forget to export your functions using the line\cr
#' @export\cr
should you provide examples.
}
\examples{
\donttest{
res <- document(file_name = system.file("files", "minimal.R",
                                        package = "document"),
                check_package = FALSE) # this is for the sake of CRAN cpu
                # time only. _Always_ stick with the default!

# View R CMD check results. If we had set check_package to TRUE in the above
# example, we now could retrieve the check results via:
cat(res[["check_result"]][["output"]][["stdout"]], sep = "\n")
cat(res[["check_result"]][["output"]][["stderr"]], sep = "\n")

# Copy docmentation to current working directory.
# This writes to your disk, so it's disabled.
# Remove or comment out the next line to enable.
if (FALSE)
    file.copy(res[["pdf_path"]], getwd())
}
}
