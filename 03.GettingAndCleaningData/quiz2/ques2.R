# /usr/bin/rscript

## Coursera Getting and Cleaning Data
## by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD
## Johns Hopkins University
##
## Question 2
##
## The sqldf package allows for execution of SQL commands on R data frames. We will 
## use the sqldf package to practice the queries we might send with the dbSendQuery 
## command in RMySQL. Download the American Community Survey data and load it into 
## an R object called
##     acs
##
## https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv 
## 
## Which of the following commands will select only the data for the probability 
## weights pwgtp1 with ages less than 50?
## 
## sqldf("select * from acs where AGEP 50")
## sqldf("select * from acs where AGEP 50 and pwgtp1")
## sqldf("select pwgtp1 from acs where AGEP 50")
## sqldf("select pwgtp1 from acs")
## 
## Description:
## This script attempts to answer the above question.
## 
## Author:
## Min Wang (min.wang@depi.vic.gov.au)
##
## Date Created:
## 17 June 2015
## 
## Date modified and reason: 
##
## Execution: 
## Rscript <MODULE_NAME>
##
## Answer:
## sqldf("select pwgtp1 from acs where AGEP < 50")

library(sqldf)

acs <- download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", "ques2.rawfile.csv", method="curl")
acs <- read.table('./ques2.rawfile.csv', sep=",", header=TRUE)
sqldf("select pwgtp1 from acs where AGEP < 50")

