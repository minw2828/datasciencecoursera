# /usr/bin/rscript

## Coursera Getting and Cleaning Data 
## by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD
## Johns Hopkins University 
## 
## Question 2
## 
## Using the jpeg package read in the following picture of your instructor into R 
##
## https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg 
## 
## Use the parameter native=TRUE. What are the 30th and 80th quantiles of the resulting 
## data? (some Linux systems may produce an answer 638 different for the 30th quantile)
##
## -16776430 -15390165
## -15259150 -594524
## -14191406 -10904118
## -15259150 -10575416
##
## Description:
## This script attempts to answer the above question. 
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


fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(url=fileUrl, destfile="./ques2.raw_data.jpg", method="curl")
list.files("./")
dateDownload <- date()
dateDownload

install.packages("jpeg")


