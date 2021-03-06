% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sampling.R
\name{sample_copula}
\alias{sample_copula}
\title{Sample conditional variables using the Gaussian copula approach}
\usage{
sample_copula(
  index_given,
  n_samples,
  mu,
  cov_mat,
  m,
  x_test_gaussian,
  x_train,
  x_test
)
}
\arguments{
\item{index_given}{Integer vector. The indices of the features to condition upon. Note that
\code{min(index_given) >= 1} and \code{max(index_given) <= m}.}

\item{m}{Positive integer. The total number of features.}

\item{x_test_gaussian}{Numeric matrix. Contains the observation whose predictions ought to be explained (test data),
after quantile-transforming them to standard Gaussian variables.}

\item{x_test}{Numeric matrix. Contains the features of the observation whose
predictions ought to be explained (test data).}
}
\value{
data.table
}
\description{
Sample conditional variables using the Gaussian copula approach
}
\examples{
m <- 10
n <- 40
n_samples <- 50
mu <- rep(1, m)
cov_mat <- cov(matrix(rnorm(n * m), n, m))
x_train <- MASS::mvrnorm(n, mu, cov_mat)
x_test <- MASS::mvrnorm(1, mu, cov_mat)
x_test_gaussian <- MASS::mvrnorm(1, mu, cov_mat)
index_given <- 3:6
ret <- shapr:::sample_copula(index_given, n_samples, mu, cov_mat, m = m,
                             x_test_gaussian, x_train, x_test)

}
\author{
Martin Jullum
}
\keyword{internal}
