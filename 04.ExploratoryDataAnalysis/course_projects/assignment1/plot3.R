# /usr/bin/rscript

## Coursera Data Science Certificates
## by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD
## Johns Hopkins University
##
## 04. Exploratory Data Analysis
##
## Course Project 1
##
## Dataset: Electric power consumption [20Mb]
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
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


download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
              "electric_power_consumption.zip", method="curl")
unzip("electric_power_consumption.zip")

dat <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")

dat$Date <- as.Date(dat$Date, "%d/%m/%Y")

data <- dat[which(dat$Date=="2007-02-01" | dat$Date=="2007-02-02"), ]

data <- transform(data, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

png("plot3.png")
plot(data$timestamp, data$Sub_metering_1, col="black", type="l", xlab="", ylab="Energy sub metering")
lines(data$timestamp, data$Sub_metering_2, col="red")
lines(data$timestamp, data$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
       lty=c(1, 1), lwd=c(1, 1), bty="n")
dev.off()




