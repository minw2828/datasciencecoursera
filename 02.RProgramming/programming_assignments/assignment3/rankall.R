# /usr/bin/rscript

## Coursera R Programming
## by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD
## Johns Hopkins University
##
## Programming Assignment 3: Hospital Quality 
## 
## Introduction
## This fourth programming assignment will be graded via a submit script which 
## is described below.
##
## Detailed Instructions
## Please download this document for detailed instructions about the assignment:
##
## https://d396qusza40orc.cloudfront.net/rprog%2Fdoc%2FProgAssignment3.pdf
##
## The zip file containing the data for this assignment can be downloaded here:
##
## https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2FProgAssignment3-data.zip
##
## For this assignment you will need to unzip this file in your working directory.
## 
## Description:
## This script implements rankall.R as per required.
##  
## Author:
## Min Wang (min.wang@ecodev.vic.gov.au)
##
## Date Created:
## 21 July 2015
## 
## Date modified and reason: 
##
## Execution: 
## Rscript <MODULE_NAME>


## > colnames(outcome)
## [2] "Hospital.Name"
## [7] "State"
## [11] "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
## [17] "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
## [23] "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"

# 4 Ranking hospitals in all states
## - Write a function called rankall that takes two arguments: an outcome name 
##   (outcome) and a hospital rank-ing (num). 
## - The function reads the outcome-of-care-measures.csv file and returns a 
##   2-column data frame containing the hospital in each state that has the 
##   ranking specified in num. 
## - For example the function call rankall("heart attack", "best") would return 
##   a data frame containing the names of the hospitals that are the best in 
##   their respective states for 30-day heart attack death rates. 
## - The function should return a value for every state (some may be NA). 
## - The first column in the data frame is named hospital, which contains the 
##   hospital name, and the second column is named state, which contains the 
##   2-character abbreviation for the state name. 
## - Hospitals that do not have data on a particular outcome should be excluded 
##   from the set of hospitals when deciding the rankings.
## - Handling ties. The rankall function should handle ties in the 30-day mortality 
##   rates in the same way that the rankhospital function handles ties.
rankall <- function(outcome, num = "best") {
        ## Read outcome data
        data <- read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv",
                         na.strings = "Not Available")
        ## Check outcome and num are valid
        outcome <- tolower(outcome)
        if (!(outcome %in%  c("heart attack", "heart failure", "pneumonia"))) {
                stop("invalid outcome")
        } else if (is.character(num) & !(num %in% c("best", "worst"))) {
                stop("invalid num")
        } 
        ## For each state, find the hospital of the given rank
        # select hospital that has the outcome
        data1 <- NULL
        if (outcome == "heart attack") {
                data1 <- data[, c(2, 11, 7)]
        } else if (outcome == "heart failure") {
                data1 <- data[, c(2, 17, 7)]
        } else {
                data1 <- data[, c(2, 23, 7)]
        }
        # filter out NA values in outcome column
        data2 <- data1[which(is.na(data1[, 2]) == FALSE), ]
        # select hospital that its ranking in each state is num

        # filter out invalid num value in each state

        # sort outcome column numerically & hospital name alphabetically
        data3 <- data2[order(data2[, 2], data2[, 1]), ]
        # manage special num values
        if (num == "best") {
                num <- 1
        } else if (num == "worst") {
                num <- nrow(data3)
        }
        ## Return a data frame with the hospital names and the (abbreviated) state name
        data4 <- data3[1:num, c(1, 3)]
        colnames(data4) <- c("hospital", "state")
        rownames(data4) <- data4[, 2]
        return(data4)
}




