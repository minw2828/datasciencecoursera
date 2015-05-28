# /usr/bin/rscript

## Coursera Getting and Cleaning Data
## by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD
## Johns Hopkins University
##
## Question 3
##
## Using the same data frame you created in the previous problem, what is the 
## equivalent function to unique(acs$AGEP)
##
## sqldf("select AGEP where unique from acs")
## sqldf("select distinct AGEP from acs")
## sqldf("select unique * from acs")
## sqldf("select unique AGEP from acs")
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


