% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/internals.R
\name{warn}
\alias{warn}
\title{Throw a Warning}
\usage{
warn(message_string, system_call = sys.call(-1), ...)
}
\arguments{
\item{message_string}{The message to be thrown.}

\item{system_call}{The call to be thrown.}

\item{...}{Arguments to be passed to \code{\link{structure}}.}
}
\value{
The condition.
}
\description{
Throws a condition of class c("document", "warning", "condition").
}
\details{
We use this condition as a warning dedicated to \pkg{document}.
}
\keyword{internal}
