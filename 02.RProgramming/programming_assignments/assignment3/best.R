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
## This script implements best.R as per required.
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


# Step 2 Finding the best hospital in a state
## - Write a function called best that take two arguments: the 2-character 
##   abbreviated name of a state and an outcome name. 
## - The function reads the outcome-of-care-measures.csv file and returns 
##   a character vector with the name of the hospital that has the best 
##   (i.e. lowest) 30-day mortality for the specified outcome in that state. 
## - The hospital name is the name provided in the Hospital.Name variable. 
## - The outcomes can be one of "heart attack", "heart failure", or "pneumonia". 
## - Hospitals that do not have data on a particular outcome should be excluded 
## from the set of hospitals when deciding the rankings.
best <- function(state, outcome) {
        ## Read outcome data
        data <- read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv", na.strings = "Not Available")
        ## Check that state and outcome are valid
        state <- toupper(state)
        outcome <- tolower(outcome)
        if (nchar(state) != 2 | !(state %in% data$State)) {
                stop("invalid state")
        } else if (!(outcome %in%  c("heart attack", "heart failure", "pneumonia"))) {
                stop("invalid outcome")
        }
        ## Return hospital name in that state with lowest 30-day death rate
        # select hospital within the state
        data1 <- data[which(data$State == state), ]
        # select hospital that has the outcome
        data2 <- NULL
        if (outcome == "heart attack") {
                data2 <- data1[, c(2, 11)]
        } else if (outcome == "heart failure") {
                data2 <- data1[, c(2, 17)]
        } else {
                data2 <- data2 <- data1[, c(2, 23)]
        }
        # filter out NA values in outcome column
        data3 <- data2[which(is.na(data2[, 2]) == FALSE), ]
        # sort outcome column numerically
        data4 <- data3[order(data3[, 2]), ]
        # handling ties
        data5 <- data4[which(data4[, 2] == min(data4[, 2])), ]
        data6 <- data5[order(data5[, 1]),]
        return(as.character(data6[1, 1]))
}

