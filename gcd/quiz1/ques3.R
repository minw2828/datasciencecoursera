# /usr/bin/rscript

## Description:
## This module answers the question 3 in the following link:
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

#install.packages("xlsx") # section 5: Melbourne
library(xlsx)

if(!file.exists("data")){dir.create("data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx?accessType=DOWNLOAD"
download.file(fileUrl, destfile='./data/ques3.raw_data.xlsx', method="curl")
dateDownloadData <- date() # return the date when this script is run.
dat <- read.xlsx('./data/ques3.raw_data.xlsx', sheetIndex=1, rowIndex = 18:23, colIndex = 7:15)
sum(dat$Zip*dat$Ext,na.rm=T) 

