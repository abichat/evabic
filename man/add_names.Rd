% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/helpers.R
\name{add_names}
\alias{add_names}
\title{Add names to a vector}
\usage{
add_names(x, names = NULL, prefix = "x")
}
\arguments{
\item{x}{A vector.}

\item{names}{Vector of names to add. If \code{NULL}, default names are added.}

\item{prefix}{The prefix to add before default names. Useful only if
\code{names} is set to \code{NULL}.}
}
\value{
A named vector
}
\description{
Add names to a vector, with default names.
}
\examples{
add_names(month.name)
}
