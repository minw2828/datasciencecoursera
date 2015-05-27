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
## Create a logical vector that identifies the households on greater than 10 acres 
## who sold more than $10,000 worth of agriculture products. Assign that logical 
## vector to the variable agricultureLogical. Apply the which() function like this 
## to identify the rows of the data frame where the logical vector is TRUE. 
## which(agricultureLogical) What are the first 3 values that result?
## 
## 59, 460, 474
## 25, 36, 45
## 125, 238, 262
## 403, 756, 798
## 
## Description:
## This script attempts to answer the above question. 
##
## Answer:
## "125" "238" "262"
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


fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url=fileUrl, destfile="./ques1.raw_data.csv", method="curl")
list.files("./")
dateDownload <- date()
dateDownload

data <- read.csv("./ques1.raw_data.csv")
head(data)
colnames(data)

agricultureLogical <- data$ACR >= 3 & data$AGS >=6
result <- rownames(data[which(agricultureLogical),][1:3,])
result

