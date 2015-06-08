# /usr/bin/rscript

## Coursera Getting and Cleaning Data
## by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD
## Johns Hopkins University
##
## Question 5
##
## The American Community Survey distributes downloadable data about United States 
## communities. Download the 2006 microdata survey about housing for the state of 
## Idaho using download.file() from here: 
##
## https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv 
## 
## using the fread() command load the data into an R object
##     DT 
## Which of the following is the fastest way to calculate the average value of the variable
##     pwgtp15 
## broken down by sex using the data.table package?
## 
## sapply(split(DT$pwgtp15,DT$SEX),mean)
## rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]
## DT[,mean(pwgtp15),by=SEX]
## tapply(DT$pwgtp15,DT$SEX,mean)
## mean(DT$pwgtp15,by=DT$SEX)
## mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
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

install.packages("data.table") # Select session 5: Australia (Melbourne)
library(data.table)

download.file(url='https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv', destfile='./ques5.raw_data.csv', method="wget")
DT <- fread('./ques5.raw_data.csv') # fread: Similar to ‘read.table’ but faster and more convenient.
DT[,mean(pwgtp15),by=SEX]

