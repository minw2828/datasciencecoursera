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
## This script attempts to answer the above question.
##  
## Author:
## Min Wang (min.wang@ecodev.vic.gov.au)
##
## Date Created:
## 25 July 2015
## 
## Date modified and reason: 
##
## Execution: 
## Rscript <MODULE_NAME>


# download data and unzip
download.file("https://d396qusza40orc.cloudfront.net/rprog%2Fdoc%2FProgAssignment3.pdf", "ProgrammingAssignment3Instructions.pdf", method="curl")
download.file("https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2FProgAssignment3-data.zip", "ProgrammingAssignment3Data.dat", method="curl")
unzip("ProgrammingAssignment3Data.dat")

# load data into R
outcome <- read.csv("F:\\PD\\Coursera\\datascience\\02.RProgramming\\rprog-data-ProgAssignment3-data\\outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
ncol(outcome)
nrow(outcome)
names(outcome)

# Step 1 Plot the 30-day mortality rates for heart attack
outcome[, 11] <- as.numeric(outcome[, 11])
## You may get a warning about NAs being introduced; that is okay
hist(outcome[, 11])
# There is nothing to submit for this part.

# Step 2 Finding the best hospital in a state
best <- function(state, outcome) {
## Read outcome data
## Check that state and outcome are valid
## Return hospital name in that state with lowest 30-day death
## rate
}

# 3 Ranking hospitals by outcome in a state
rankhospital <- function(state, outcome, num = "best") {
## Read outcome data
## Check that state and outcome are valid
## Return hospital name in that state with the given rank
## 30-day death rate
}

# 4 Ranking hospitals in all states
rankall <- function(outcome, num = "best") {
## Read outcome data
## Check that state and outcome are valid
## For each state, find the hospital of the given rank
## Return a data frame with the hospital names and the
## (abbreviated) state name
}
