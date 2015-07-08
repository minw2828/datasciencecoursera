# /usr/bin/rscript

## Coursera R Programming
## by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD
## Johns Hopkins University
##
## Data
## data for questions 11–20 in this Quiz can be downloaded here:
## https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fquiz1_data.zip
## 
## Question 11
## In the dataset provided for this Quiz, what are the column names of the dataset?
## 
## Question 12
## Extract the first 2 rows of the data frame and print them to the console. What does 
## the output look like?
## 
## Question 13
## How many observations (i.e. rows) are in this data frame?
##
## Question 14
## Extract the last 2 rows of the data frame and print them to the console. What does 
## the output look like?
##
## Question 15
## What is the value of Ozone in the 47th row?
## 
## Question 16
## How many missing values are in the Ozone column of this data frame?
## 
## Question 17
## What is the mean of the Ozone column in this dataset? Exclude missing values (coded 
## as NA) from this calculation.
## 
## Question 18
## Extract the subset of rows of the data frame where Ozone values are above 31 and Temp 
## values are above 90. What is the mean of Solar.R in this subset?
## 
## Question 19
## What is the mean of "Temp" when "Month" is equal to 6?
##
## Question 20
## What was the maximum ozone value in the month of May (i.e. Month = 5)?
##
## Description:
## This script attempts to answer the above question.
##  
## Author:
## Min Wang (min.wang@depi.vic.gov.au)
##
## Date Created:
## 5 May 2015
## 
## Date modified and reason: 
##
## Execution: 
## Rscript <MODULE_NAME>


download.file(url="https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fquiz1_data.zip", "quiz1.dat", method="curl")
unzip("quiz1.dat")
list.files()
data <- read.csv("hw1_data.csv")
system("rm quiz1.dat")

## Question 11
## In the dataset provided for this Quiz, what are the column names of the dataset?
colnames(data)

## Question 12
## Extract the first 2 rows of the data frame and print them to the console. What does
## the output look like?
data[1:2, ]

## Question 13
## How many observations (i.e. rows) are in this data frame?
nrow(data)

## Question 14
## Extract the last 2 rows of the data frame and print them to the console. What does
## the output look like?
data[152:153, ]

## Question 15
## What is the value of Ozone in the 47th row?
data$Ozone[47]

## Question 16
## How many missing values are in the Ozone column of this data frame?
length(which(is.na(data$Ozone)==TRUE))

## Question 17
## What is the mean of the Ozone column in this dataset? Exclude missing values (coded
## as NA) from this calculation.
mean(data[which(is.na(data$Ozone) == FALSE),]$Ozone)
## or 
mean(data$Ozone, na.rm=TRUE)

## Question 18
## Extract the subset of rows of the data frame where Ozone values are above 31 and Temp
## values are above 90. What is the mean of Solar.R in this subset?
mean(data[which(data$Ozone>31 & data$Temp > 90),]$Solar.R)

## Question 19
## What is the mean of "Temp" when "Month" is equal to 6?
mean(data[which(data$Month == 6),]$Temp)

## Question 20
## What was the maximum ozone value in the month of May (i.e. Month = 5)?
max(data[which(data$Month == 5),]$Ozone, na.rm = TRUE)


