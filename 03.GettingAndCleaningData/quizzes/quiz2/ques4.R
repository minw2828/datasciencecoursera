# /usr/bin/rscript

## Coursera Getting and Cleaning Data
## by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD
## Johns Hopkins University
##
## Question 4
##
## How many characters are in the 10th, 20th, 30th and 100th lines of HTML from 
## this page: 
##
## http://biostat.jhsph.edu/~jleek/contact.html 
##
## (Hint: the nchar() function in R may be helpful)
##
## 43 99 8 6
## 43 99 7 25
## 45 92 7 2
## 45 31 2 25
## 45 31 7 31
## 45 31 7 25
## 45 0 2 2
## 
## Description:
## This script attempts to answer the above question.
##  
## Author:
## Min Wang (min.wang@depi.vic.gov.au)
##
## Date Created:
## 17 June 2015
## 
## Date modified and reason: 
##
## Execution: 
## Rscript <MODULE_NAME>
## 
## Answer:
## 45 31 7 25 

con = url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode = readLines(con)
close(con)
htmlCode

lapply(as.vector(htmlCode[c(10, 20, 30, 100)]), nchar)

