# /usr/bin/rscript

## Coursera Getting and Cleaning Data 
## by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD
## Johns Hopkins University 
## 
## Question 3
##
## In the data set from Question 2 what is a regular expression that would 
## allow you to count the number of countries whose name begins with "United"? 
## Assume that the variable with the country names in it is named countryNames. 
## How many countries begin with United?
##
## grep("*United",countryNames), 2
## grep("United$",countryNames), 3
## grep("*United",countryNames), 5
## grep("^United",countryNames), 3
## 
## 
## Answer:
## grep("^United",countryNames), 3
## 
## Description:
## This script attempts to answer the above question. 
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


data         <- read.table("./ques2.raw_data.csv", sep=",", header=FALSE, quote="\"", na.strings=c("",".","NA"), skip=5)
countries    <- data[,4]
countryNames <- countries[!is.na(countries)]
grep("^United", countryNames)

