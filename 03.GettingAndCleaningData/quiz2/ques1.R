# /usr/bin/rscript

## Coursera Getting and Cleaning Data
## by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD
## Johns Hopkins University
##
## Question 1
##
## Register an application with the Github API here 
##     https://github.com/settings/applications. 
## Access the API to get information on your instructors repositories (hint: this 
## is the url you want "https://api.github.com/users/jtleek/repos"). Use this data 
## to find the time that the datasharing repo was created. What time was it created? 
## This tutorial may be useful (https://github.com/hadley/httr/blob/master/demo/oauth2-github.r). 
## You may also need to run the code in the base R package and not R studio.
## 
## 2013-11-07T13:25:07Z
## 2013-08-28T18:18:50Z
## 2014-02-06T16:13:11Z
## 2014-01-04T21:06:44Z
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


download.file(url='https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv', destfile='./ques1.raw_data.csv', method="wget")
data           <- read.table('./ques1.raw_data.csv', sep=",", header=TRUE)
property_value <- data$VAL
filtered_pv    <- na.omit(property_value)
count <- 0
for (item in filtered_pv) {
    if (item >= 24){
        count <- count+1
    }
}
print(count)
