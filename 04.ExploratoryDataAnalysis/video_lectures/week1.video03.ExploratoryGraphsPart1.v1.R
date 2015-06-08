## Exploratory Graphs (Part 1)
## One Dimensional Summary

## Why do we use graphs in data analysis?
##   - To understand data properties
##   - To find patterns in data
##   - To suggest modeling strategies
##   - To "debug" analysis
##   - To communicate results (Later, other lectures)
##
## Characteristics of exploratory graphs:
##   - They are made quickly
##   - A large number are made
##   - The goal is for personal understanding
##   - Axes/legends are gnerally cleaned up (later)
##   - Color/size are primarily used for information
##
## Practical Example:
## Air Pollution in the United States.
## Question: Are there any counties in the U.S. that exceed that national standard 
##           for fine particle pollution?
## Note: National standard: 
##       For fine particle pollution (PM2.5), the "annual mean, averaged over 3 years"
##       cannot exceed 12 ug/m3.

# Data
pollution <- read.csv("data/avgpm25.csv", colClasses=c("numeric", "character", "factor", "numeric", "numeric"))
head(pollution)

## Simple Symmaries of Data
## One dimension
##   - Five-number/Six-number summary
##   - Boxplot
##   - Histograms
##   - Density plot
##   - Barplot

## Six-number summary
summary(pollution$pm25)
# Intepretation: Since the maximum == 18.40 > 12 (national standard). We're sure at 
#                least one counties exceed the limit already.

## Boxplot
boxplot(pollution$pm25, col="blue")
# Intepretation: An alternative to Six-number summary, differed by visualizing the 
#                result in a graph instead of a table. The conclusion drawn in boxplot
#                is the same as Six-number summary.
## Overlaying Features
boxplot(pollution$pm25, col="blue")
abline(h=12)
# Tips: h: horizontal. 12 is the standard, so it provides a nice overview of the dots 
#       in comparison to the standard.

## Histogram
hist(pollution$pm25, col="green")
# Intepretation: Another alternative to Six-number summary and Boxplot, but it gives 
#                a little more about the details about the shape of the distribution 
#                of this variable.
rug(pollution$pm25)
# Tips: Put a rug shows exactly where the points are under the histogram. You can thus 
#       see exactly where the outliners are, etc.
#       rug(): Create a set of tick marks along the base of a plot.
## Change the breaks of the histogram
hist(pollution$pm25, col="green", breaks=100)
rug(pollution$pm25)
# Tips: Adjust the breaks so it best illustrate the info within the data. 
## Overlaying Features
abline(v=12, lwd=2)
abline(v=median(pollution$pm25), col="magenta", lwd=4)
# Tips: v: vertical; lwd: The line width, a positive number, defaulting to 1.
# Note: Two straight lines are added into the same graph

## Bar plot
barplot(table(pollution$region), col="wheat", main="Number of Counties in Each Region")
# Intepretation: Count the number of couties in each region. 
 
