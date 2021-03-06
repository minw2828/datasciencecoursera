# /usr/bin/rscript

## Coursera Getting and Cleaning Data
## by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD
## Johns Hopkins University
##
## Course Project
## 
## The purpose of this project is to demonstrate your ability to collect, work 
## with, and clean a data set. The goal is to prepare tidy data that can be used 
## for later analysis. You will be graded by your peers on a series of yes/no 
## questions related to the project. You will be required to submit: 
## 1) a tidy data set as described below, 
## 2) a link to a Github repository with your script for performing the analysis, 
## 3) a code book that describes the variables, the data, and any transformations 
##    or work that you performed to clean up the data called CodeBook.md. You 
##    should also include a README.md in the repo with your scripts. This repo 
##    explains how all of the scripts work and how they are connected.  
##
## One of the most exciting areas in all of data science right now is wearable 
## computing - see for example this article:
## http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/
## Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most 
## advanced algorithms to attract new users. The data linked to from the course 
## website represent data collected from the accelerometers (加速度计) from the 
## Samsung Galaxy S smartphone. A full description is available at the site where 
## the data was obtained: 
## 
## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
## 
## Here are the data for the project: 
##
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
## 
## You should create one R script called run_analysis.R that does the following. 
## - Merges the training and the test sets to create one data set.
## - Extracts only the measurements on the mean and standard deviation for each measurement. 
## - Uses descriptive activity names to name the activities in the data set.
## - Appropriately labels the data set with descriptive variable names. 
## - From the data set in step 4, creates a second, independent tidy data set with 
##   the average of each variable for each activity and each subject.
## 
## 
## Description:
## This script downloads the zip file from above website and performs analytical tasks 
## as required. The output file from step 5 is named as averages_data.txt and will be 
## placed in the same folder as where this script is executed.
##  
## Author:
## Min Wang (min.wang@ecodev.vic.gov.au)
##
## Date Created:
## 17 July 2015
## 
## Date modified and reason: 
##
## Execution: 
## Rscript run_analysis.R


# download data and unzip
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
              "raw_data.dat", method="curl")
unzip("raw_data.dat")

# load data into R
train_data    <- read.table('UCI HAR Dataset/train/X_train.txt')
train_label   <- read.table('UCI HAR Dataset/train/y_train.txt')
train_subject <- read.table('UCI HAR Dataset/train/subject_train.txt')
test_data     <- read.table('UCI HAR Dataset/test/X_test.txt')
test_label    <- read.table('UCI HAR Dataset/test/y_test.txt')
test_subject  <- read.table('UCI HAR Dataset/test/subject_test.txt')

# Step 1
# Merge the training and test sets to create one data set
data    <- rbind(train_data, test_data)
label   <- rbind(train_label, test_label)
subject <- rbind(train_subject, test_subject)

# Step 2
# Extracts only the measurements on the mean and standard deviation for each 
# measurement.
feature <- read.table("UCI HAR Dataset/features.txt")
colnames(data) <- feature$V2
result <- data[, grep("-(mean|std)\\(\\)", colnames(data))]

# Step 3
# Use descriptive activity names to name the activities in the data set
activity <- read.table('UCI HAR Dataset/activity_labels.txt')
label[, 1] <- activity[label[, 1], 2]
colnames(label) <- 'activity'

# Step 4
# Appropriately label the data set with descriptive variable names
colnames(subject) <- 'subject'
all_data <- cbind(data, label, subject)

# Step 5
# Create a second, independent tidy data set with the average of each variable
# for each activity and each subject
library(plyr)
averages_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[,1:561]))
write.table(averages_data, "averages_data.txt", row.name=FALSE, col.names = TRUE, quote = FALSE)

