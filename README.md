# Homeric

![Zenodo DOI badge](https://zenodo.org/badge/doi/10.5281/zenodo.57065.svg)

Doughnut plots for R

```{r}
library(Homeric)
v <- runif(5)
names(v) <- LETTERS[1:length(v)]
par(mfrow=c(2, 3), mar=c(0, 0, 0, 0), oma=c(0, 0, 5, 0))
PlotDoughnut(v, centre.text='Doughnut', centre.cex=1.8, labels.cex=2)
PlotDoughnut(v, centre.text='Counter-clockwise', centre.cex=1.8, labels.cex=2,
             clockwise=FALSE)
PlotDoughnut(v, centre.text=~Origin~at~90^o, centre.cex=1.8, labels.cex=2,
             origin.degrees=90)
PlotDoughnut(v, centre.text='Half nut', centre.cex=1.8, labels.cex=2, to.degrees=180,
             origin=-90)
PlotDoughnut(v, centre.text='Side nut', centre.cex=1.8, labels.cex=2, to.degrees=180,
             origin=0)
PlotDoughnut(v, centre.text='Taken a bite', centre.cex=1.8, labels.cex=2,
             to.degrees=270, origin=-45, clockwise=FALSE)
title(main='You doughnut', outer=TRUE, cex.main=3)
```

![Example doughnut plot](../screenshots/doughnut1.png?raw=true)
