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
## This script impletements rankhospital.R as per required.
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


# Step 3 Ranking hospitals by outcome in a state
## - Write a function called rankhospital that takes three arguments: the 
##   2-character abbreviated name of a state (state), an outcome (outcome), 
##   and the ranking of a hospital in that state for that outcome (num).
## - The function reads the outcome-of-care-measures.csv file and returns a 
##   character vector with the name of the hospital that has the ranking 
##   specified by the num argument. 
## - For example, the call rankhospital("MD", "heart failure", 5) would return 
##   a character vector containing the name of the hospital with the 5th lowest 
##   30-day death rate for heart failure. 
## - The num argument can take values "best", "worst", or an integer indicating 
##   the ranking (smaller numbers are better). 
## - If the number given by num is larger than the number of hospitals in that 
##   state, then the function should return NA. 
## - Hospitals that do not have data on a particular outcome should be excluded 
##   from the set of hospitals when deciding the rankings.
## - Handling ties. It may occur that multiple hospitals have the same 30-day 
##   mortality rate for a given cause of death. In those cases ties should be 
##   broken by using the hospital name. 
rankhospital <- function(state, outcome, num = "best") {
        ## Read outcome data
        data <- read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv",
                         na.strings = "Not Available")
        ## Check that state, outcome and num are valid
        state   <- toupper(state)
        outcome <- tolower(outcome)
        if (nchar(state) != 2 | !(state %in% data$State)) {
                stop("invalid state")
        } else if (!(outcome %in%  c("heart attack", "heart failure", "pneumonia"))) {
                stop("invalid outcome")
        } else if (is.character(num) & !(num %in% c("best", "worst"))) {
                stop("invalid num")
        } else if (is.numeric(num) & num > nrow(data)) {
                return(NA)
        }
        ## Return hospital name in that state with the given rank 30-day death rate
        # select hospital within the state
        data1 <- data[which(data$State == state), ]
        # select hospital that has the outcome
        data2 <- NULL
        if (outcome == "heart attack") {
                data2 <- data1[, c(2, 11)]
        } else if (outcome == "heart failure") {
                data2 <- data1[, c(2, 17)]
        } else {
                data2 <- data1[, c(2, 23)]
        }
        # filter out NA values in outcome column
        data3 <- data2[which(is.na(data2[, 2]) == FALSE), ]
        # sort outcome column numerically & hospital name alphabetically
        data4 <- data3[order(data3[, 2], data3[, 1]), ]
        # manage special num values
        if (num == "best") {
                num <- 1
        } else if (num == "worst") {
                num <- nrow(data4)
        }
        # return value
        return(as.character(data4[num, 1]))
} 


