# /usr/bin/rscript

## Coursera Getting and Cleaning Data 
## by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD
## Johns Hopkins University 
## 
## Question 4
## 
## What is the average GDP ranking for the "High income: OECD" and "High income: 
## nonOECD" group?
##
## 133.72973, 32.96667
## 23.966667, 30.91304
## 30, 37
## 23, 45
## 32.96667, 91.91304
## 23, 30
## 
## Description:
## This script attempts to answer the above question. 
##
## Answer:
## 32.96667, 91.91304
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
library(reshape2)
library(plyr)

destfile1 <- "./ques3.raw_data.1.csv"
destfile2 <- "./ques3.raw_data.2.csv"
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

## What is the average GDP ranking for the "High income: OECD" and "High income:
## nonOECD" group?
colnames(result_table)
sprt   <- split(result_table$"Ranking", result_table$"Income Group")
g1     <- sprt$`High income: OECD`
g2     <- sprt$`High income: nonOECD`
tmp_g1 <- gsub(",", "", g1)
tmp_g2 <- gsub(",", "", g2)
g1n    <- as.numeric(tmp_g1)
g2n    <- as.numeric(tmp_g2)

mean(g1n); mean(g2n)

