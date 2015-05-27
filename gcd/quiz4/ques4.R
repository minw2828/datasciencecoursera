# /usr/bin/rscript

## Coursera Getting and Cleaning Data 
## by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD
## Johns Hopkins University 
## 
## Question 4
##
## Load the Gross Domestic Product data for the 190 ranked countries in this 
## data set: 
##
## https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv 
## 
## Load the educational data from this data set: 
##
## https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv 
##
## Match the data based on the country shortcode. Of the countries for which 
## the end of the fiscal year is available, how many end in June? 
##
## Original data sources: 
## http://data.worldbank.org/data-catalog/GDP-ranking-table 
## http://data.worldbank.org/data-catalog/ed-stats
##
## 16
## 15
## 13
## 7
## 
## Description:
## This script attempts to answer the above question. 
##
## Answer:
## 13
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


library(data.table)

download.file(url="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", destfile="./ques4.raw_data.1.csv", method="curl")
download.file(url="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", destfile="./ques4.raw_data.2.csv", method="curl")
downloadDate <- date()

data1 <- fread("./ques4.raw_data.1.csv", sep=",", skip=5, na.strings=c("", NA))
data2 <- fread("./ques4.raw_data.2.csv", sep=",")

head(data1)
head(data2)

# clean up data1
# remove columns that all values are NA
tmp_data1 <- Filter(function(x)!all(is.na(x)), data1)
# remove rows that all values are NA
tmp_tmp_data1 <- tmp_data1[!apply(tmp_data1, 1, function(x) all(is.na(x))),] 
# remove rows whose first column is NA
final_data1 <- tmp_tmp_data1[which(!is.na(tmp_tmp_data1$V1)), ]

# get concordance naming convention for data2
final_data2 <- data2

colnames(final_data1)
colnames(final_data2)

colnames(final_data1) <- c("CountryCode", "Ranking", "Long Name", "GDP", "Unknown")
setkey(final_data1, "CountryCode")
setkey(final_data2, "CountryCode")

result_table <- merge(final_data1, final_data2)

grep("Fiscal year end: June", result_table$Special Notes, value=TRUE)

