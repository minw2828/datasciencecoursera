# /usr/bin/rscript

## Coursera Getting and Cleaning Data 
## by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD
## Johns Hopkins University 
## 
## Question 5
##
## You can use the quantmod ( http://www.quantmod.com/) package to get historical 
## stock prices for publicly traded companies on the NASDAQ and NYSE. Use the 
## following code to download data on Amazon's stock price and get the times the 
## data was sampled.
## 
##    library(quantmod)
##    amzn = getSymbols("AMZN",auto.assign=FALSE)
##    sampleTimes = index(amzn) 
##
## How many values were collected in 2012? How many values were collected on Mondays 
## in 2012?
##
## 252, 47
## 365, 52
## 250, 47
## 250, 51
## 
## Description:
## This script attempts to answer the above question. 
##
## Answer:
## 250, 47
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


install.packages("quantmod")

library(quantmod)

amzn        <- getSymbols("AMZN",auto.assign=FALSE)
sampleTimes <- index(amzn) 

head(amzn)
head(sampleTimes)

nrow(amzn)
length(sampleTimes)

target_year <- grep('2012', sampleTimes, value=TRUE)

length(target_year)
length(grep('Monday', weekdays(as.Date(target_year)), value=TRUE))


