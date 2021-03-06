% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_data.R
\name{get_data}
\alias{get_data}
\title{Query random user data from the Random User Generator API}
\usage{
get_data(n = 1, seed = NULL)
}
\arguments{
\item{n}{Number of users to fetch, up to 5,000 generated users in one request. Defaults to 1}

\item{seed}{A character string used to generate the same set of users. Defaults to NULL.}
}
\value{
A tibble that contains random user data
}
\description{
Query random user data from the Random User Generator API
}
\examples{

get_data(n = 10, seed = "1990")

}
