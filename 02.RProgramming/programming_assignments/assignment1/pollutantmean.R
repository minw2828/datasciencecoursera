# /usr/bin/rscript

## Coursera R Programming
## by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD
## Johns Hopkins University
##
## Data:
## https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip
## 
## Part 1
## Write a function named 'pollutantmean' that calculates the mean of a 
## pollutant (sulfate or nitrate) across a specified list of monitors. The 
## function 'pollutantmean' takes three arguments: 'directory', 'pollutant', 
## and 'id'. Given a vector monitor ID numbers, 'pollutantmean' reads that 
## monitors' particulate matter data from the directory specified in the 
## 'directory' argument and returns the mean of the pollutant across all of 
## the monitors, ignoring any missing values coded as NA. The function that 
## you write should be able to match the expected output. Please save your 
## code to a file named pollutantmean.R.
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


pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used

        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        ## NOTE: Do not round the result!
		
		filename <- paste(paste(directory, sprintf("%03d", id), sep="\\"), "csv", sep=".")
		result <- list()
		for (file in filename) {
		        data <- read.csv(file)
				result[[file]] <- data[, which(colnames(data) == pollutant)]
		}
		return(mean(unlist(result), na.rm=TRUE))	
}
