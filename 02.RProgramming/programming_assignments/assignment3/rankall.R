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
## 23 July 2015
## 
## Date modified and reason: 
##
## Execution: 
## Rscript <MODULE_NAME>


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
library(plyr)
require(dplyr)
library(data.table)

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
        # rename colnames 
        colnames(data2) = c("hospital", "outcome", "state")
        # rank data frame by group      
        # handling ties: ties should be broken by using the hospital name.
        data3 <- data2 %>% group_by(data2[, 3]) %>% arrange(data2[, 2], data2[, 1]) %>% mutate(rank=row_number())
        ## Return a data frame with the hospital names and the (abbreviated) state name
        data4 <- NULL
        if (num == "best") {
                data4 <- data3[which(data3$rank == 1), ]
                data5 <- data4[, c("hospital", "state")]
                data5 <- as.data.frame(data5)
        } else if (num == "worst"){
                data4 <- aggregate(rank~state, data3, max)
                # or data4 <- ddply(data3, .(state), summarize, rank=max(rank))
                data3 <- data.table(data3)
                data4 <- data.table(data4)
                setkeyv(data3, c("state", "rank"))
                setkeyv(data4, c("state", "rank"))
                data5 <- merge(data3, data4)
                data5 <- as.data.frame(data5)[, c("hospital", "state")]
        } else {
                # data4 <- ddply(data3, .(state), subset, rank == num)
                data4 <- ddply(data3, .(state), function(x) {
                        x[which(x$rank == num),]
                })
                data4 <- data4[, c("hospital", "state")]
                all_states <- as.data.frame(levels(data3$state))
                colnames(all_states) <- "state"
                data4 <- data.table(data4)
                all_states <- data.table(all_states)
                setkeyv(data4, c("state"))
                setkeyv(all_states, c("state"))
                data5 <- merge(data4, all_states, all.y=TRUE)
                data5 <- as.data.frame(data5)[, c("hospital", "state")]
        }
        rownames(data5) <- data5[, 2]
        return(data5)
}

