## Exploratory Graphs (Part 2)
## Two Dimensional Summary

## Two dimensional summary plots inlcude:
##   - Multiple/overlayed 1-D plots (Lattice/ggplot2)
##   - Scatterplots
##   - Smooth scatterplots
##
## Greater than 2 dimensional plots: (Be clever with them)
##   - Overlayed/multiple 2-D plots; coplots (Not so useful)
##   - Use color, size, shape to add dimensions
##   - Spinning plots
##   - Actual 3-D plots (not so useful)
##   - A better (practical) practice is to layout 3-D plto information into 2-D 
##     plots
##
 
## Multiple Boxplots
boxplot(pm25 ~ region, data=pollution, col="red")
# Intepretation: Illustrate that on average, east region has higher pollution 
#                than the west region, but west region has wide spread (larger 
#                standard deviation than east region).

## Multiple Histograms
par(mfrow=c(2,1), mar=c(4,4,2,1))
hist(subset(pollution, region="east")$pm25, col="green")
hist(subset(pollution, region="west")$pm25, col="green")
# Intepretation: Illustrate similar info as Multiple Boxplots
# Tips: par(): can be used to set or query graphical parameters. 
#       mfcol, mfrow: A vector of the form c(nr, nc). Subsequent figures will be 
#                     drawn in an nr-by-nc array on the device by columns (mfcol), 
#                     or rows (mfrow), respectively.
#       mar: A numerical vector of the form c(bottom, left, top, right) which gives 
#            the number of lines of margin to be specified on the four sides of the 
#            plot. The default is c(5, 4, 4, 2) + 0.1.

## Scatterplot
with(pollution, plot(latitude, pm25))
abline(h=12, lwd=2, lty=2)
# Intepretation: It shows PM2.5 is particularlly concentrated in middle latitudes
#                and show PM2.5 levels are higher than the national standard 12.
# Tips: with( ): applys an expression to a dataset. It is similar to DATA= in SAS; 
#       lty: set line type.
## Scatterplot - Using Color
with(pollution, plot(latitude, pm25, col=region))
abline(h=12, lwd=2, lty=2)
# Intepretation: black dots are west counties and red dots are east counties. So
#                it enables the visualizaiton of three variables all at once.
## Multiple Scatterplots
par(mfrow=c(1,2), mar=c(5,4,2,1))
with(subset(pollution, region=="west"), plot(latitude, pm25, main="West"))
with(subset(pollution, region=="east"), plot(latitude, pm25, main="East"))
# Intepretation: In both regions, higher pollutions tend to be in middle lattitudes.

## Summary 
## * Exploratory plots are "quick and dirty"
## * Let you summarize the data (usually graphically) and hi
## * Explore basic questions and hyptheses (and perhaps rule them out)
## * Suggest modeling strategies for the "next step"
##
## Further resources
## * R Graph Gallery
## * R Bloggers

