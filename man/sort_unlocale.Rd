% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{sort_unlocale}
\alias{sort_unlocale}
\title{Sort a Character Vector in Lexical Order Avoiding the Locale}
\usage{
sort_unlocale(char)
}
\arguments{
\item{char}{The character vector to sort.}
}
\value{
The sorted character vector.
}
\description{
\code{\link{sort}} uses the collation of the locale (see
\code{\link{Comparison}}), which results in different sorting. If a
(\pkg{RUnit})
check relies on sorting, we need to avoid the locale.
}
\keyword{internal}
