# /usr/bin/rscript

## Coursera Getting and Cleaning Data
## by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD
## Johns Hopkins University
##
## Course Project 1
## 
## Dataset: Electric power consumption [20Mb]
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip


download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
              "electric_power_consumption.zip", method="curl")
unzip("electric_power_consumption.zip")

dat <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")

dat$Date <- as.Date(dat$Date, "%d/%m/%Y")

data <- dat[which(dat$Date=="2007-02-01" | dat$Date=="2007-02-02"), ]

png("plot1.png")
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", col="red")
dev.off()



