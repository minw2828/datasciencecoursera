# /usr/bin/rscript

## Description:
## This module answers the question 5 in the following link:
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

install.packages("data.table") # Select session 5: Australia (Melbourne)
library(data.table)

download.file(url='https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv', destfile='./ques5.raw_data.csv', method="wget")
DT <- fread('./ques5.raw_data.csv') # fread: Similar to ‘read.table’ but faster and more convenient.
DT[,mean(pwgtp15),by=SEX]
