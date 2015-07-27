## Base Plotting System (Part2)

## Base Plotting Functions:
##   - plot:   make a scatterplot, or other type of plot depending on the class  
##             of the object being plotted
##   - lines:  add lines to a plot, given a vector x values and a corresponding 
##             vector of y values (or a 2-column matrix); this function just 
##             connects the dots
##   - points: add points to a plot
##   - text:   add text labels to a plot using specified x,y coordinates
##   - title:  add annotations to x, y axis labels, title, subtitle, outer margin
##   - mtext:  add arbitrary text to the margins (inner or outer) of the plot
##   - axis:   add axis ticks/labels

## Base Plot with Annotation
library(datasets)
with (airquality, plot(Wind, Ozone))
title(main="Ozone and Wind in New York City") ## Add a title

with (airquality, plot(Wind, Ozone, main="Ozone and Wind in New York City"))
with (subset(airquality, Month==5), points(Wind, Ozone, col="blue"))

# type="n" sets up everything in a plot but does not actually plot anything
with (airquality, plot(Wind, Ozone, main="Ozone and Wind in New York City", type="n"))
# start to actually plot the plot
with (subset(airquality, Month==5), points(Wind, Ozone, col="blue"))
with (subset(airquality, Month!=5), points(Wind, Ozone, col="red"))
# add a legend to the plot
legend("topright", pch=1, col=c("blue", "red"), legend=c("May", "Other Months"))

## Base Plot with Regression Line
# pch=20: small fill-in circle
with (airquality, plot(Wind, Ozone, main="Ozone and Wind in New York City", pch=20))
# fill into linear model
model <- lm(Ozone ~ Wind, airquality)
# another annotaion function
abline(model, lwd=2)

## Multiple Base Plots
# one row, two columns. i.e. plot the two graphs side by side
par(mfrow=c(1,2))
with(airquality, {
     plot(Wind, Ozone, main="Ozone and Wind")
     plot(Solar.R, Ozone, main="Ozone and Solar Radiation")
})

# make the margin of each small plots smaller than default; 
# make the outer margin of the whole plot larger than default, in particular the 
# top outer margin a bit bigger so that mtext can be written over there
par(mfrow=c(1,3), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(airquality, {
     plot(Wind, Ozone, main="Ozone and Wind")
     plot(Solar.R, Ozone, main="Ozone and Solar Radiation")
     plot(Temp, Ozone, main="Ozone and Temperature")
     # add an outer title to this whole plot
     mtext("Ozone and Weather in New York City", outer=TRUE)
})

## Summary
##   - Plots in the base plotting system are created by calling successive R 
##     functions to "build up" a plot
##   - Plotting occurs in two stages:
##     - Creation of a plot
##     - Annotation of a plot (add lines, points, text, legends)
##   - The base plotting system is very flexible and offers a high degree of 
##     control over plotting

