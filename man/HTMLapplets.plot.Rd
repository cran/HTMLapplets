\name{HTMLapplets.plot}
\alias{HTMLapplets.plot}
\title{HTMLapplets.plot}
\description{
  Create a dynamic 2D scatterplot in an R2HTML document.
}
\usage{
HTMLapplets.plot(x, y = NULL,
            file = .HTML.file, append = TRUE,
            id = "plotml",
            plot = TRUE, data.link = TRUE, center=TRUE, help=FALSE,
            width = 500, height = 400, background ="ffffff",
            codebase = ".", archive = "plotmlapplethb8.jar",
            copy.jar = TRUE, overwrite.jar=TRUE,
            ...)
}
  
\arguments{
  \item{x}{the coordinates of points in the plot.}
  \item{y}{the coordinates of points in the plot.}
  \item{file}{HTML target output file.}
  \item{append}{if TRUE output will be appended to 'file' otherwise it will overwrite the content of the file.}
  \item{id}{plot identifier.}
  \item{plot}{if TRUE, the plotML file is created}
  \item{data.link}{add a link to the plotML file in the HTML file}
  \item{center}{center the output in the HTML document}
  \item{help}{print a help message in the HTML file}
  \item{width}{applet width}
  \item{height}{applet height}
  \item{background}{background colour of the plot (no "\#" allowed)}
  \item{codebase}{codebase parameter for the applet tag.}
  \item{archive}{name of the jar file.}
  \item{copy.jar}{if TRUE (default) the jar file is copied to the HTML
    target directory}
  \item{overwrite.jar}{if TRUE (default) replace the jar file if it exists.}
  \item{...}{\code{\link{plotML}} parameters}
}
\value{}
\references{}
\seealso{
  \code{\link{plot}},
  \code{\link[R2HTML]{HTML}}
}

\examples{
data(ChickWeight)

l <- split(ChickWeight[,c("Time","weight")], ChickWeight$Chick)
for(i in 1:length(l)) names(l[[i]]) <- c("Time",paste("Chick",i,sep=""))
chicks <- data.frame(Time=sort(unique(ChickWeight$Time)))
for(i in 1:length(l))
  chicks <- merge(chicks,l[[i]], all=TRUE)
mean <- apply(chicks,1,mean, na.rm=TRUE)
sd <- apply(chicks,1,sd, na.rm=TRUE)

cat("CREATING \"./chicksPlot.html\"\n")

HTMLInitFile("./","chicksPlot")
HTML.title("HTMLapplets")
# first plot
HTMLapplets.plot(id="all",
            x=chicks$Time,
            y=chicks[,2:10],
            xlab="time", ylab="Weight", main="Test1",
            xlim=c(8,13), ylim=c(50,100),
            type="l", pch=1, height=250, help=TRUE)
HTMLhr()
# second plot
HTMLapplets.plot(id="summary",
            x=chicks$Time,
            y=mean,
            xlab="time", ylab="Weight", type="l", main="Test2",
            pch=1, height=250, background="e0e0e0",
            data.link=FALSE,
            diameter=round(mean/max(mean)*20+1),
            col=gsub("#","",rgb(1-mean/max(mean),0,mean/max(mean))),
            low.error=mean-sd, high.error=mean+sd)
HTMLEndFile()
}
\keyword{}

