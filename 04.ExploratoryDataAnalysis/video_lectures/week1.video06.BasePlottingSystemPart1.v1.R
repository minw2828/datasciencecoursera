## Base Plotting System (Part 1)

## Plotting System:
## The core plotting and graphics engine in R is encapsulated in the following 
## packages:
##   - graphics:  contains plotting functions for the "base" graphing systems,
##                including plot, hist, boxplot and many others.
##   - grDevices: contains all the code implementing the various graphics 
##                devices, including X11, PDF, PostScript, PNG, etc.
## The lattice plotting system is implemented using the following packages:
##   - lattice: contains code for producing Trellis graphics, which are 
##              independent of the "base" graphics system; includes functions 
##              like xyplot, bwplot, levelplot
##   - grid:    implements a different graphing system independent of the "base"
##              system; the lattice package builds on the top of grid; we 
##              seldom call functions from the grid package directly
##
## The Process of Making a Plot:
## A few consideration (not necessarily in this order):
##   - Where will the plot be made? On the screen? In a file?
##   - How will the plot be used?
##      - For viewing temporarily on the screen? 
##      - Be present in a web browser?
##      - Be present in a paper that might be printed?
##      - Be used in a presentation?
##   - Plot a large amount of data or just a few points?
##   - Do you need to dynamically resize the graphic?
##   - What graphic system: base, lattice or ggplot2? They are not interchangeable.
##     
## Here we focus on using the base plotting system to create graphics on the 
## screen device.
##
## Base Graphics:
## - Base graphics are:
##     - USed most commonly 
##     - A very powerful for creating 2-D graphics
## - There are two phases to create a base plot:
##     - Initialize a new plot
##     - Annotate (add to) an existing plot
## - Calling plot(x,y) or hist(x) will launch a graphics device (if one is not already
##   open) and draw a new plot on the device
## - The base graphics system has many parameters that can sest and tweaked; these 
##   parameters are documented in ?par; it wouldn't hurt to try to memorize this help
##   page!

## Simple Base Graphics: Histogram
library(datasets)
hist(airquality$Ozone) ## Draw a new plot

## Simple Base Graphics: Scatterplot
library(datasets)
with(airquality, plot(Wind, Ozone))

## Simple Base Graphics: Boxplot
library(datasets)
# ?transform: ‘transform’ is a generic function, which-at least currently-only does 
#             anything useful with data frames.  ‘transform.default’ converts its 
#             first argument to a data frame if possible and calls 
#             ‘transform.data.frame’.
airquality <- transform(airquality, Month=factor(Month))
boxplot(Ozone ~ Month, airquality, xlab="Month", ylab="Ozone (ppb)")

## Some important Base Graphics Parameters
## Many base plotting functions share a set of parameters. Here are a few key ones:
##   - pch: the plotting symbol (default: open ciucle)
##   - lty: the line type (default: solid line), can be dashed, dotted, etc.
##   - lwd: the line width, specified as an integer multiple
##   - col: the plotting color, specified as a number, string or hex code; the 
##          colors() function gives you a vector of colors by name
##   - xlab: character string for the x-axis label
##   - ylab: character string for the y-axis label
##
## The par() function is used to specify global graphics parameters that affect all
## plots in an R session. There parameteres can be overridden when specified as 
## arguments to specific plotting functions.
##   - las:   the orientation of the axis labels on the plot
##   - bg:    the background color
##   - mar:   the margin size
##   - oma:   the outer margin size (default: 0 for all sides)
##   - mfrow: number of plots per row, column (plots are filled row-wise)
##   - mfcol: number of plots per row, column (plots are filled column-wise)

## Default values for global graphics parameters 
par("lty")
par("col")
par("pch")
par("bg")
par("mar")
par("mfrow")
par("mfcol")


