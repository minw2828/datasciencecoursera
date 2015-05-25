# /usr/bin/rscript

## Coursera Getting and Cleaning Data
## by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD
## Johns Hopkins University
##
## Question 3
## 
## Download the Excel spreadsheet on Natural Gas Aquisition Program here: 
## 
## https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx
## 
## Read rows 18-23 and columns 7-15 into R and assign the result to a variable called:
##     dat 
## What is the value of:
##     sum(dat$Zip*dat$Ext,na.rm=T) 
## (original data source: http://catalog.data.gov/dataset/natural-gas-acquisition-program)
## 
## 184585
## 0
## 36534720
## NA
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

#install.packages("xlsx") # section 5: Melbourne
library(xlsx)

if(!file.exists("data")){dir.create("data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx?accessType=DOWNLOAD"
download.file(fileUrl, destfile='./data/ques3.raw_data.xlsx', method="curl")
dateDownloadData <- date() # return the date when this script is run.
dat <- read.xlsx('./data/ques3.raw_data.xlsx', sheetIndex=1, rowIndex = 18:23, colIndex = 7:15)
sum(dat$Zip*dat$Ext,na.rm=T) 

