# /usr/bin/rscript

## Coursera Getting and Cleaning Data
## by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD
## Johns Hopkins University
##
## Course Project 2
## 
## Data
## The data for this assignment are available from the course web site as a 
## single zip file:
## Data for Peer Assessment [29Mb]
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip
##
## The zip file contains two files:
## - PM2.5 Emissions Data (summarySCC_PM25.rds): This file contains a data frame 
##   with all of the PM2.5 emissions data for 1999, 2002, 2005, and 2008. For 
##   each year, the table contains number of tons of PM2.5 emitted from a 
##   specific type of source for the entire year. 
## - Source Classification Code Table (Source_Classification_Code.rds): This table 
##   provides a mapping from the SCC digit strings in the Emissions table to the 
##   actual name of the PM2.5 source. The sources are categorized in a few different 
##   ways from more general to more specific and you may choose to explore whatever 
##   categories you think are most useful. For example, source "10100101" is known 
##   as "Ext Comb /Electric Gen /Anthracite Coal /Pulverized Coal".
##
## The overall goal of this assignment is to explore the National Emissions Inventory 
## database and see what it say about fine particulate matter pollution in the United 
## states over the 10-year period 1999-2008. You may use any R package you want to 
## support your analysis.


library(data.table)
library(plyr)
library(ggplot2)

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",
              "peer_assessment.dat.zip", method="curl")
unzip("peer_assessment.dat.zip")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI <- as.data.table(NEI)
SCC <- as.data.table(SCC)

## Questions 3
## Of the four types of sources indicated by the type (point, nonpoint, onroad,
## nonroad) variable, which of these four sources have seen decreases in 
## emissions from 1999 to 2008 for Baltimore City? Which have seen increases in 
## emissions from 1999 to 2008? Use the ggplot2 plotting system to make a plot 
## answer this question.

dat_Maryland <- NEI[which(NEI$fips == "24510"),]

trend <- ddply(dat_Maryland, .(year, type), summarise, total_emission_year_type=sum(Emissions))

g <- ggplot(trend, aes(year, total_emission_year_type))+ facet_grid(type~.) + geom_point()
ggsave(filename="plot3.png", plot=g)


