# /usr/bin/rscript

## Coursera Data Science Certificates
## by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD
## Johns Hopkins University
##
## 05. Reproducible Research 
##
## Course Project 2
##
## Data
## Storm Data:
## https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2
## Storm Data documentation:
## https://d396qusza40orc.cloudfront.net/repdata%2Fpeer2_doc%2Fpd01016005curr.pdf
##
## Author:
## Min Wang (min.wang@ecodev.vic.gov.au)
##
## Date Created:
## 31 July 2015
##
## Date modified and reason:
##
## Execution:
## Rscript <MODULE_NAME>


library(knitr)
library(data.table)
library(plyr)
library(ggplot2)
library(zoo)
library(scales)
library(Hmisc)


download.file("https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2",
              "storm_data.csv.bz2", method="curl")
system("bunzip2 storm_data.csv.bz2")
unlink("storm_data.csv.bz2")

data <- read.csv("storm_data.csv")
dim(data)
head(data)


## Questions 1
## Across the United States, which types of events (as indicated in the EVTYPE 
## variable) are most harmful with respect to population health?



## Question 2
## Across the United States, which types of events have the greatest economic 
## consequences?




