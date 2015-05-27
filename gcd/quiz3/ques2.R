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
## Answer
## -15259150 -10575416
## 
## Author:
## Min Wang (min.wang@depi.vic.gov.au)
##
## Date Created:
## 27 May 2015
##
## Note:
## 1. I cannot load jpeg package in BASC, so the analysis was done in R interface, 
##    Windows based system. 
## 2. I cannot download the jpg file in a correct form using the download.file() command
##    under Windows system so I download the file via regular web browser based interface 
##    approach
## 3. After the above two corrections, the rest of the code gets the answer correctly.
## 
## Date modified and reason:
##
## Execution:
## Rscript <MODULE_NAME>


install.packages("jpeg")

library(jpeg)

fileUrl  <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"

# under linux system
# destfile <- "./ques2.raw_data.jpg"
# download.file(url=fileUrl, destfile=destfile, method="curl")
# list.files("./")

# under Windows system
destfile <- "C:\\Users\\minwang827\\Desktop\\ques2.raw_data.jpg"
download.file(url=fileUrl, destfile=destfile, method="wininet")
list.files("C:\\Users\\minwang827\\Desktop")

dateDownload <- date()
dateDownload

data <- readJPEG(destfile, native=TRUE)
head(data)

quantile(data, probs=c(0.3, 0.8))
quantile(data, probs=seq(0,1,0.1))


