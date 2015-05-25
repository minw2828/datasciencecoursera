# /usr/bin/rscript

## Coursera Getting and Cleaning Data
## by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD
## Johns Hopkins University
##
## Question 4
##
## Read the XML data on Baltimore restaurants from here: 
## 
## https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml 
##
## How many restaurants have zipcode 21231?
## 
## 181
## 100
## 17
## 127
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


library(XML)
library(RCurl)

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
xData <- getURL(fileURL)
doc <- xmlParse(xData)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
all_zipcodes <- xpathSApply(rootNode, "//zipcode", xmlValue)
count <- 0
for (item in all_zipcodes) {
    if (item == 21231) {
        count <- count + 1
    }
} 
print(count)
