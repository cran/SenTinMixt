% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dmsen.R
\name{dmsen}
\alias{dmsen}
\title{Density of a MSEN distribution}
\usage{
dmsen(x, mu = rep(0, d), Sigma, theta = Inf, formula = "direct")
}
\arguments{
\item{x}{A data matrix with \code{n} rows and \code{d} columns, being \code{n} the number of data points and \code{d} the data the dimensionality.}

\item{mu}{A vector of length \code{d} representing the mean value.}

\item{Sigma}{A symmetric positive-definite matrix representing the scale matrix of the distribution.}

\item{theta}{A number greater than 0 indicating the tailedness parameter.}

\item{formula}{Method used to calculate the density: "direct", "indirect", "series".}
}
\value{
The value(s) of the density in x
}
\description{
Density of a MSEN distribution
}
\examples{
d <- 3
x <- matrix(rnorm(d*2), 2, d)
dmsen(x, mu = rep(0,d), Sigma = diag(d), theta = 0.4, formula = "direct")
}
\references{
Punzo A., and Bagnato L. (2020). Allometric analysis using the multivariate shifted exponential normal distribution.
\emph{Biometrical Journal}, \strong{62}(6), 1525-1543.
}
