# /usr/bin/rscript

## Coursera R Programming
## by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD
## Johns Hopkins University
##
## Description:
## This script downloads submission script for this assignment.
##
## Script:
## https://d396qusza40orc.cloudfront.net/rprog%2Fscripts%2Fsubmitscript1.R
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
download.file("https://d396qusza40orc.cloudfront.net/rprog%2Fscripts%2Fsubmitscript1.R",
              "submitscript1.R", method="curl")

