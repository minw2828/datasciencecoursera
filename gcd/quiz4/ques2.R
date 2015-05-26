# /usr/bin/rscript

## Coursera Getting and Cleaning Data 
## by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD
## Johns Hopkins University 
## 
## Question 2
##
## Load the Gross Domestic Product data for the 190 ranked countries in this 
## data set: 
##
## https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv 
##
## Remove the commas from the GDP numbers in millions of dollars and average 
## them. What is the average? 
## 
## Original data sources: http://data.worldbank.org/data-catalog/GDP-ranking-table
##
## 387854.4
## 293700.3
## 379596.5
## 377652.4
## 
## Description:
## This script attempts to answer the above question. 
##
## Answer:
## 
## 
## Author:
## Min Wang (min.wang@depi.vic.gov.au)
##
## Date Created:
## 25 May 2015
##
## Date modified and reason:
##
## Execution:
## Rscript <MODULE_NAME>


download.file(url="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", destfile="./ques2.raw_data.csv", method="curl")
dataDownloaded <- date()
data           <- read.table("./ques2.raw_data.csv", sep=",", header=FALSE, quote="\"", na.strings=c("",".","NA"), skip=5)
GDP            <- data[,5]
reformat_GDP   <- gsub(",", "", GDP,)
mean(as.numeric(reformat_GDP), na.rm=TRUE)
