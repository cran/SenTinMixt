% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Mixt.fit.R
\name{Mixt.fit}
\alias{Mixt.fit}
\title{Fitting for parsimonious mixtures of MSEN or MTIN distributions}
\usage{
Mixt.fit(
  X,
  k = 1:3,
  init.par = NULL,
  cov.model = "all",
  theta.model = "all",
  density,
  ncores = 1,
  verbose = FALSE,
  ret.all = FALSE
)
}
\arguments{
\item{X}{A data matrix with \code{n} rows and \code{d} columns, being \code{n} the number of data points and \code{d} the data the dimensionality.}

\item{k}{An integer or a vector indicating the number of groups of the models to be estimated.}

\item{init.par}{The initial values for starting the algorithms, as produced by the \code{Mixt.fit.init()} function.}

\item{cov.model}{A character vector indicating the parsimonious structure of the scale matrices. Possible values are:
"EII", "VII", "EEI", "VEI", "EVI", "VVI", "EEE", "VEE", "EVE", "EEV", "VVE", "VEV", "EVV", "VVV" or "all".
When "all" is used, all of the 14 parsimonious structures are considered.}

\item{theta.model}{A character vector indicating the parsimonious structure of the tailedness parameters. Possible values are:
"E", "V" or "all". When "all" is used, both parsimonious structures are considered.}

\item{density}{A character indicating the density of the mixture components. Possible values are: "MSEN" or "MTIN".}

\item{ncores}{A positive integer indicating the number of cores used for running in parallel.}

\item{verbose}{A logical indicating whether the running output should be displayed.}

\item{ret.all}{A logical indicating whether to report the results of all the models or only those of the best models according to BIC and ICL.}
}
\value{
A list with the following elements:
\item{all.models}{The results related to the all the fitted models (only when \code{ret.all=TRUE}).}
\item{BicWin}{The best fitting model according to the BIC.}
\item{IclWin}{The best fitting model according to the ICL.}
\item{Summary}{A quick table showing summary results for the best fitting models according to BIC and ICL.}
}
\description{
Fits, by using EM-based algorithms, parsimonious mixtures of MSEN or MTIN distributions to the given data.
Parallel computing is implemented and highly recommended for a faster model fitting. The Bayesian
information criterion (BIC) and the integrated completed likelihood (ICL) are used to select the best
fitting models according to each information criterion.
}
\examples{
set.seed(1234)
n <- 50
k <- 2
Pi <- c(0.5, 0.5)
mu <- matrix(c(0, 0, 4, 5), 2, 2)
cov.model <- "EEE"
lambda <- c(0.5, 0.5)
delta <- c(0.7, 0.7)
gamma <- c(2.62, 2.62)
theta <- c(0.1, 0.1)
density <- "MSEN"
data <- rMixt(n, k, Pi, mu, cov.model, lambda, delta, gamma, theta, density)

X <- data$X
nstartR <- 1
init.par <- Mixt.fit.init(X, k, density, nstartR)

theta.model <- "E"
res <- Mixt.fit(X, k, init.par, cov.model, theta.model, density)
}
