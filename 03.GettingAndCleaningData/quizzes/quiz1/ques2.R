# /usr/bin/rscript

## Coursera Getting and Cleaning Data
## by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD
## Johns Hopkins University
## 
## Question 2
## 
## Use the data you loaded from Question 1. Consider the variable FES in the code 
## book. Which of the "tidy data" principles does this variable violate?
## 
## Each variable in a tidy data set has been transformed to be interpretable.
## Tidy data has one variable per column.
## Numeric values in tidy data can not represent categories.
## Tidy data has no missing values. 
##
## Answer
## Tidy data has one variable per column.
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


data <- read.table('./raw_data.csv', sep=",", header=TRUE)
fes  <- data$FES
print(fes)

