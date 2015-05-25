# /usr/bin/rscript

## Coursera Getting and Cleaning Data
## by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD
## Johns Hopkins University
##
## Question 1
##
## The American Community Survey distributes downloadable data about United States 
## communities. Download the 2006 microdata survey about housing for the state of 
## Idaho using download.file() from here: 
##
## https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv 
## 
## and load the data into R. The code book, describing the variable names is here: 
## 
## https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf
## 
## How many properties are worth $1,000,000 or more?
## 47
## 25
## 159
## 53
## 
## Description:
## This script attempts to answer the above question.
##  
## Author:
## Min Wang (min.wang@depi.vic.gov.au)
##
## Date Created:
## 5 May 2015
## 
## Date modified and reason: 
##
## Execution: 
## Rscript <MODULE_NAME>


download.file(url='https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv', destfile='./ques1.raw_data.csv', method="wget")
data           <- read.table('./ques1.raw_data.csv', sep=",", header=TRUE)
property_value <- data$VAL
filtered_pv    <- na.omit(property_value)
count <- 0
for (item in filtered_pv) {
    if (item >= 24){
        count <- count+1
    }
}
print(count)
