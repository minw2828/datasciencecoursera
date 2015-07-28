# /usr/bin/rscript

## Coursera Data Science Certificates
## by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD
## Johns Hopkins University
##
## 04. Exploratory Data Analysis
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
## Assignment
## The overall goal of this assignment is to explore the National Emissions Inventory
## database and see what it say about fine particulate matter pollution in the United
## states over the 10-year period 1999-2008. You may use any R package you want to
## support your analysis.
##
## Author:
## Min Wang (min.wang@ecodev.vic.gov.au)
##
## Date Created:
## 27 July 2015
##
## Date modified and reason:
##
## Execution:
## Rscript <MODULE_NAME>


library(data.table)
library(plyr)

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",
              "peer_assessment.dat.zip", method="curl")
unzip("peer_assessment.dat.zip")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI <- as.data.table(NEI)
SCC <- as.data.table(SCC)

## Questions 6
## Compare emissions from motor vehicle sources in Baltimore City with emissions
## from motor vehicle sources in Los Angeles County, California (fips == "06037").
## Which city has seen greater changes over time in motor vehicle emissions?

data_motor <- SCC[grepl("Vehicles", SCC$Short.Name, ignore.case=TRUE), ]

NEI        <- as.data.table(NEI)
data_motor <- as.data.table(data_motor)

setkey(NEI, SCC)
setkey(data_motor, SCC)

data_merge <- merge(NEI, data_motor)

dat_Maryland <- data_merge[which(data_merge$fips == "24510" | data_merge$fips == "06037"),]

trend <- ddply(dat_Maryland, .(year, fips), summarise, total_emission_year=sum(Emissions))
trend[trend$fips == "06037", ]$fips <- "Los Angeles County"
trend[trend$fips == "24510", ]$fips <- "Baltimore City"

g <- ggplot(trend, aes(year, total_emission_year)) + geom_point(aes(color = trend$fips))
ggsave(filename="plot6.png", plot=g)



