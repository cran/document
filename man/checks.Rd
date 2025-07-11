% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/internals.R
\name{checks}
\alias{checks}
\title{Get Warnings or Notes From \code{\link[rcmdcheck]{rcmdcheck}}}
\usage{
checks(rcmdcheck_value)
}
\arguments{
\item{rcmdcheck_value}{The return value of
\code{\link[rcmdcheck]{rcmdcheck}}.}
}
\value{
A named logical vector, all \code{\link[base:logical]{FALSE}} if
there were no errors, warnings or notes.
}
\description{
\code{\link[rcmdcheck]{rcmdcheck}} returns a list containing characters
that give errors, warnings and notes.
}
\details{
Use \code{! any(checks(x)))} to ensure there were no errors, warnings or
notes in \code{x}.
}
\keyword{internal}
