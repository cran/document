% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/document.R
\name{write_the_docs}
\alias{write_the_docs}
\title{Write Documentation to Disk}
\usage{
write_the_docs(
  package_directory,
  file_name = package_directory,
  output_directory = tempdir(),
  dependencies = NULL,
  sanitize_Rd = TRUE,
  runit = FALSE
)
}
\arguments{
\item{package_directory}{The directory containing the package's source.}

\item{file_name}{The name of the file where to write the documentation into.
See \strong{Details}.}

\item{output_directory}{The directory to put the documentation into. You
might want to use \code{\link[base]{dirname}(file_name)}.}

\item{dependencies}{A character vector of package names the functions depend
on.}

\item{sanitize_Rd}{Remove strange characters from \code{Rdconv}?}

\item{runit}{Convert the text received from the help files if running
\pkg{RUnit}?
Do not bother, this is for Unit testing only.}
}
\value{
A list containing
\describe{
    \item{pdf_path}{The path to the pdf file produced.}
    \item{txt_path}{The path to the text file produced.}
    \item{html_path}{The path to the html file produced.}
}
}
\description{
Read R documentation files from a package's source, convert and write them
to disk.
}
\details{
\code{file_name} will usually be provided by \code{\link{document}} as the
R code file's name. This may, differing from a (temporary) package's name,
contain underscores. If you use the functions directly: stick with the
default, in which case internally
the  \code{\link[base]{basename}} of your \code{package_directory} will be
used. This should be a good guess.
}
\keyword{internal}
