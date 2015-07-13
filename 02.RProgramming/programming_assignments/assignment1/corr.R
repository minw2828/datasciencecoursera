# /usr/bin/rscript

## Coursera R Programming
## by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD
## Johns Hopkins University
##
## Data:
## https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip
## 
## Part 3
## Write a function that takes a directory of data files and a threshold for 
## complete cases and calculates the correlation between sulfate and nitrate 
## for monitor locations where the number of completely observed cases (on all 
## variables) is greater than the threshold. The function should return a vector 
## of correlations for the monitors that meet the threshold requirement. If no 
## monitors meet the threshold requirement, then the function should return a 
## numeric vector of length 0. The function that you write should be able to match 
## the expected output. Please save your code to a file named corr.R. 
## 
## For this function you will need to use the 'cor' function in R which calculates 
## the correlation between two vectors. Please read the help page for this function 
## via '?cor' and make sure that you know how to use it.
## 
## Description:
## This script attempts to answer the above question.
##  
## Author:
## Min Wang (min.wang@ecodev.vic.gov.au)
##
## Date Created:
## 12 July 2015
## 
## Date modified and reason: 
##
## Execution: 
## Rscript <MODULE_NAME>


corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        ## Return a numeric vector of correlations
        ## NOTE: Do not round the result!
		
		
		return()
}
