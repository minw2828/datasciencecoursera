# /usr/bin/rscript

## Coursera Getting and Cleaning Data 
## by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD
## Johns Hopkins University 
## 
## Question 3
##
## Load the Gross Domestic Product data for the 190 ranked countries in this data 
## set: 
##
## https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv 
## 
## Load the educational data from this data set: 
## 
## https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv 
##
## Match the data based on the country shortcode. How many of the IDs match? Sort 
## the data frame in descending order by GDP rank (so United States is last). What 
## is the 13th country in the resulting data frame? 
##
## Original data sources: 
## http://data.worldbank.org/data-catalog/GDP-ranking-table 
## http://data.worldbank.org/data-catalog/ed-stats
##
## 234 matches, 13th country is Spain
## 234 matches, 13th country is St. Kitts and Nevis
## 190 matches, 13th country is Spain
## 190 matches, 13th country is St. Kitts and Nevis
## 189 matches, 13th country is Spain
## 189 matches, 13th country is St. Kitts and Nevis 
## 
## Description:
## This script attempts to answer the above question. 
##
## Answer:
## 189 matches, 13th country is St. Kitts and Nevis
## 
## Author:
## Min Wang (min.wang@depi.vic.gov.au)
##
## Date Created:
## 27 May 2015
##
## Date modified and reason:
##
## Execution:
## Rscript <MODULE_NAME>


library(data.table)
library(plyr)

fileUrl1  <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
destfile1 <- "./ques3.raw_data.1.csv"
download.file(url=fileUrl1, destfile=destfile1, method="curl")
list.files("./")
dateDownload <- date()
dateDownload

fileUrl2  <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
destfile2 <- "./ques3.raw_data.2.csv"
download.file(url=fileUrl2, destfile=destfile2, method="curl")
list.files("./")
dateDownload <- date()
dateDownload

data1 <- fread(destfile1, sep=",", skip=5, na.strings=c("", "..", NA))
data2 <- fread(destfile2, sep=",", na.strings=c("", "..", NA))

head(data1)
head(data2)

# clean up data1
# remove columns that all values are NA
tmp_data1 <- Filter(function(x)!all(is.na(x)), data1)
# remove rows that all values are NA
tmp_tmp_data1 <- tmp_data1[!apply(tmp_data1, 1, function(x) all(is.na(x))),]
# remove rows whose first column is NA
final_data1 <- tmp_tmp_data1[which(!is.na(tmp_tmp_data1$V1)), ]

colnames(final_data1) <- c("CountryCode", "Ranking", "Long Name", "GDP", "Unknown")
target_data1 <- arrange(final_data1, Ranking, na.last=TRUE)[1:190,]
target_data2 <- data2

setkey(target_data1, "CountryCode")
setkey(target_data2, "CountryCode")
result_table <- merge(target_data1, target_data2)

nrow(result_table)

result_table$GDP <- as.numeric(gsub(",", "", result_table$GDP,))
rt <- result_table[which(!is.na(result_table$GDP)), ]
sorted_rt <- arrange(rt, desc(GDP), na.last=TRUE)

sorted_rt$"Long Name.x"[13]

