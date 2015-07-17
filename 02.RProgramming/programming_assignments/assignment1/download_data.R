# /usr/bin/rscript

## Coursera R Programming
## by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD
## Johns Hopkins University
##
## Description:
## This script downloads data from the following website and unzip the file
## to prepare for analyses in this assignment.
##
## Data:
## https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip
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


# download data from website and unzip 
download.file("https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip", 
              "rprog-data-specdata.zip", method="curl")
unzip("rprog-data-specdata.zip")

