\name{HTMLapplets.data.frame}
\alias{HTMLapplets.data.frame}
\alias{HTMLapplets}
\title{HTMLapplets.data.frame}
\description{
  Displays a data frame in a dynamic grid within an R2HTML
  document. Undesired effects might occur if several plots are put into
  a single HTML document.
}
\usage{
HTMLapplets.data.frame(x,
                       file = .HTML.file, append = TRUE,
                       id = "csvtab", data.link = TRUE, center=TRUE,
                       save.csv = TRUE,
                       width = 500, height = 400,
                       codebase = ".",
                       archive = "tablesortcsv.jar",
                       copy.jar = TRUE, overwrite.jar = TRUE,
                       ...)
}  
\arguments{
  \item{x}{the input data frame.}
  \item{file}{HTML target output file.}
  \item{append}{if TRUE output will be appended to 'file' otherwise it will overwrite the content of the file.}
  \item{id}{grid identifier.}
  \item{data.link}{add a link to the CSV file in the HTML file.}
  \item{center}{center the output in the HTML document.}
  \item{save.csv}{if TRUE, the CSV file is created.}
  \item{width}{applet width.}
  \item{height}{applet height.}
  \item{codebase}{codebase parameter for the applet tag. If the jar
    files are in a specific directory (e.g. HTTPDIR/runtime/jar/),
    set the codebase parameter accordingly (e.g. "/runtime/jar") and set
    the parameter copy.jar to FALSE.}
  \item{archive}{name of the jar file.}
  \item{copy.jar}{if TRUE (default) the jar file is copied to the HTML target directory.}
  \item{overwrite.jar}{if TRUE (default) replace the jar file if it
    exists.}
  \item{...}{}
}
\value{}
\references{}
\seealso{
  \code{\link{data.frame}},
  \code{\link[R2HTML]{HTML}},
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

cat("CREATING \"./chicksGrid.html\"\n")

HTMLInitFile("./","chicksGrid")
HTML.title("HTMLapplets")
# grid
HTMLapplets.data.frame(chicks[,1:10],height=100)
HTMLEndFile()
}
\keyword{}

