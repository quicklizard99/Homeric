\name{PlotDoughnut}
\alias{PlotDoughnut}
\title{Plot doughnut}
\description{Plot values as a doughnut.}
\usage{
PlotDoughnut(
    values,
    clockwise=TRUE,
    origin.degrees=0,
    radius=1,
    thickness=0.5,
    frame.plot=FALSE,
    xlim=c(-radius, radius),
    ylim=c(-radius, radius),
    col=NULL,
    n=2500,
    centre.text=NULL,
    centre.cex=par('cex'),
    centre.col='black',
    labels=names(values),
    labels.cex=par('cex'),
    labels.col='black',
    labels.radius=radius-thickness/2,
    to.degrees=360,
    \dots)
}

\arguments{
  \item{values}{values to be plotted.}
  \item{clockwise}{if \code{TRUE} values are plotted clockwise.}
  \item{origin.degrees}{clockwise number of degrees, starting at 12 o'clock,
      at which the first value is plotted.}
  \item{radius}{radius of the outside of the doughnut.}
  \item{thickness}{thickness of the doughnut.}
  \item{frame.plot}{if \code{TRUE} a frame is drawn.}
  \item{xlim}{the x limits of the plot.}
  \item{ylim}{the y limits of the plot.}
  \item{col}{colours of the segments.}
  \item{n}{number of points that make up the inside and outside of the circles.}
  \item{centre.text}{text to be plotted inside the doughnut.}
  \item{centre.cex}{character expansion factor of the centre text.}
  \item{centre.col}{colour of the centre text.}
  \item{labels}{labels to be plotted within each.}
  \item{labels.cex}{character expansion factor of the labels.}
  \item{labels.col}{colour of the labels.}
  \item{labels.radius}{radius at which labels will be plotted.}
  \item{to.degrees}{a value of 360 plots a complete doughnut; 180 plots half a
      doughnut.}
  \item{\dots}{other values to be passed to plotting functions.}
}

\details{Plots `values' in a doughnut. `PlotDonut` is a synonym for
`PlotDoughnut`.
}

\author{Lawrence Hudson}

\examples{
# Six presentations of the same data
v <- c(25, 25, 12.5, 12.5, 25)
names(v) <- LETTERS[1:length(v)]
par(mfrow=c(2, 3), mar=c(0, 0, 0, 0), oma=c(0, 0, 5, 0))
PlotDoughnut(v, centre.text='Doughnut')
PlotDoughnut(v, centre.text='Counter-clockwise', clockwise=FALSE)
PlotDoughnut(v, centre.text=~Origin~at~90^o, origin.degrees=90)
PlotDoughnut(v, centre.text='Half nut', to.degrees=180, origin=-90)
PlotDoughnut(v, centre.text='Side nut', to.degrees=180, origin=0)
PlotDoughnut(v, centre.text='Taken a bite', to.degrees=270, origin=-45,
    clockwise=FALSE, thickness=0.1)
title(main='You doughnut', outer=TRUE, cex.main=3)
}
\keyword{hplot}
