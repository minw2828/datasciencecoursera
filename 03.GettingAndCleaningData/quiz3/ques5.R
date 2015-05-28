# /usr/bin/rscript

## Coursera Getting and Cleaning Data 
## by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD
## Johns Hopkins University 
## 
## Question 5
##
## Cut the GDP ranking into 5 separate quantile groups. Make a table versus Income.
## Group. How many countries are Lower middle income but among the 38 nations with 
## highest GDP?
## 
## 13
## 18
## 12
## 5 
## 
## Description:
## This script attempts to answer the above question. 
##
## Answer:
## 5
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


install.packages("Hmisc")

library(data.table)
library(reshape2)
library(plyr)
library(Hmisc)

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

## Cut the GDP ranking into 5 separate quantile groups. Make a table versus Income.
## Group. How many countries are Lower middle income but among the 38 nations with
## highest GDP?
colnames(result_table)
result_table$rankingGroups <- cut2(as.numeric(result_table$"Ranking"), g=5)
mt <- table(result_table$rankingGroups, result_table$"Income Group")
mt["[  1, 39)", "Lower middle income"]




