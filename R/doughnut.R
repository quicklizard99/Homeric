PlotDoughnut <- function(values, clockwise=TRUE, origin.degrees=0,
    radius=1, thickness=0.5, frame.plot=FALSE, xlim=c(-radius, radius),
    ylim=c(-radius, radius), col=NULL, n=2500,
    centre.text=NULL, centre.cex=par('cex'), centre.col='black',
    labels=names(values), labels.cex=par('cex'), labels.col='black',
    labels.radius=radius-thickness/2, to.degrees=360, ...) {

    stopifnot(to.degrees>0 && to.degrees<=360)
    stopifnot(radius > 0)
    stopifnot(thickness > 0 && thickness <= radius)
    stopifnot(n >= 4)

    # n complex numbers
    outer <- complex(modulus=radius, argument=seq(0, 2 * pi * to.degrees / 360,
                                                  length.out=n))

    # Zero degrees is at 12 o'clock, positive numbers are clockwise
    outer <- outer * complex(argument=(ifelse(clockwise, 1, -1) * origin.degrees -
                                       90 + ifelse(clockwise, 0, 1) * 180) * 2 * pi/360)
    if (clockwise) {
        outer <- Conj(outer)
    }

    inner <- outer  * (radius - thickness)

    plot(NA, xlim=xlim, ylim=ylim, frame.plot=frame.plot, type='n', xlab="",
         ylab="", xaxt="n", yaxt="n", ...)

    # Ensure a circle
    pin <- par("pin")
    y.multiplier <- pin[1] / pin[2]

    # Matrix of coordinates for the inner and outer circles
    coords <- cbind(outer.x=Re(outer),
                    outer.y=Im(outer) * y.multiplier,
                    inner.x=Re(inner),
                    inner.y=Im(inner) * y.multiplier)

    # Breakpoints into the matrix of coordinates
    breaks <- c(1, round(n * cumsum(values) / sum(values), 0))

    col <- if(is.null(col)) 1+1:length(values) else col

    for(index in 2:length(breaks)) {
        lower <- index-1
        polygon(x=c(coords[breaks[lower]:breaks[index], 'outer.x'],
                    coords[breaks[index]:breaks[lower], 'inner.x']),
                y=c(coords[breaks[lower]:breaks[index], 'outer.y'],
                    coords[breaks[index]:breaks[lower], 'inner.y']), 
                col=col[lower], border=NA, ...)
    }

    if(!is.null(centre.text)) {
        text(0, 0, centre.text, cex=centre.cex, col=centre.col, ...)
    }

    labels.coords <- outer[round(head(breaks, -1) + diff(breaks)/2, 0)] * labels.radius
    labels.coords <- cbind(x=Re(labels.coords), y=Im(labels.coords) * y.multiplier)
    if(!is.null(labels)) {
        text(labels.coords, labels=labels, col=labels.col, cex=labels.cex, ...)
    }

    invisible(list(coords=coords, 
                   breaks=breaks,
                   labels=labels.coords))
}
