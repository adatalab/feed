% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/j_cal.R
\name{j_cal}
\alias{j_cal}
\title{j_cal}
\usage{
j_cal(joule, standard = "15")
}
\arguments{
\item{joule}{joule.}

\item{standard}{"thermochemical" = Thermochemical calorie; "4" = 4°C calorie; "15" = 15°C calorie; "20" = 20°C calorie; "mean" = mean calorie (https://en.wikipedia.org/wiki/Calorie).}
}
\description{
This function converts joule into calorie.
}
\examples{
j_cal(joule = 4000, standard = "15")
}
\keyword{feed}
\keyword{formulation}
