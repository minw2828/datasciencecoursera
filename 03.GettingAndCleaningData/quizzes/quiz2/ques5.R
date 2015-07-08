# /usr/bin/rscript

## Coursera Getting and Cleaning Data
## by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD
## Johns Hopkins University
##
## Question 5
##
## Read this data set into R and report the sum of the numbers in the fourth of 
## the nine columns. 
##
## https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for 
##
## Original source of the data: http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for 
## 
## (Hint this is a fixed width file format)
##
## 28893.3
## 32426.7
## 222243.1
## 101.83
## 36.5
## 35824.9
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
## Note:
## "report the sum of the numbers in the fourth of the nine columns." means: 
## "report the sum of the variables in the fourth column"
## 
## Date modified and reason: 
##
## Execution: 
## Rscript <MODULE_NAME>
##
## Answer:
## 32426.7

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for", "./ques5.rawfile.dat", method="curl")

data <- read.fwf(file = "./ques5.rawfile.dat", widths = c(12, 7,4, 9,4, 9,4, 9,4), skip = 4, row.names=1)

sum(data$V4)

