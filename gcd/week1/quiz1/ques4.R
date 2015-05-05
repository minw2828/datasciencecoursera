# /usr/bin/rscript

## Description:
## This module answers the question 1 in the following link:
## https://class.coursera.org/getdata-014/quiz/attempt?quiz_id=25
##
## You will need the description of variable name from the following link:
## https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf
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

fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml'
doc <- xmlTreeParse(fileUrl, useInternal=TRUE) # parse content
rootNode <- xmlRoot(doc)
xmlName(rootNode)


