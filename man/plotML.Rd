\name{plotML}
\alias{plotML}
\title{plotML}
\description{
  Create a plotML file.
}
\usage{
plotML(x, y = NULL,
       low.error=NULL, high.error=NULL,
       col=NULL, diameter=NULL,
       file,
       type = "p", pch = 1,
       xlim = NULL, ylim = NULL,
       log = "",
       main = NULL, xlab = "x", ylab = "y",
       bg = "ffffff")
}
  
\arguments{
  \item{x}{the coordinates of points in the plot.}
  \item{y}{the coordinates of points in the plot.}
  \item{file}{output file name.}
  \item{low.error}{low value for error bars}
  \item{high.error}{high value for error bars}
  \item{col}{colours for the data points}
  \item{diameter}{diameter in pixels of the points}
  \item{type}{}
  \item{pch}{}
  \item{xlim}{the initial x limits (min,max) of the plot.}
  \item{ylim}{the initial y limits (min,max) of the plot.}
  \item{log}{see \code{\link{plot.default}}.}
  \item{main}{a main title for the plot.}
  \item{xlab}{a label for the x axis.}
  \item{ylab}{a label for the y axis.}
  \item{bg}{background colour.}
}
\value{}
\references{}
\seealso{
  \code{\link{HTMLapplets.plot}},
  \code{\link{plot}}
}

\keyword{}

