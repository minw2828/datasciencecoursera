# /usr/bin/rscript

## Coursera R Programming
## by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD
## Johns Hopkins University
##
## Data:
## https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip
## 
## Part 2
## Write a function that reads a directory full of files and reports the 
## number of completely observed cases in each data file. The function should 
## return a data frame where the first column is the name of the file and the 
## second column is the number of complete cases. The function that you write 
## should be able to match the expected output. Please save your code to a file 
## named complete.R.
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


# impletement assignment function as required
complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
		
		result <- data.frame(matrix(nrow=length(id), ncol=2))
		colnames(result) <- c("id", "nobs")
		nr <- 1
		for (i in id) {
		        filename <- paste(paste(directory, sprintf("%03d", i), sep="/"), "csv", sep=".")
		        data <- read.csv(filename)
				result$id[nr] <-  i
				result$nobs[nr] <- nrow(data[which(!is.na(data$sulfate) & !is.na(data$nitrate)),])
				nr <- nr+1
		}
		return(result)
}


