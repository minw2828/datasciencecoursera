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
## Description:
## This script attempts to answer the above question.
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
## Rscript <MODULE_NAME>


# download data and unzip
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
              "raw_data.dat", method="curl")
unzip("raw_data.dat")

# examine data
list.files(".")
list.files("UCI HAR Dataset")
list.files("UCI HAR Dataset/train")
list.files("UCI HAR Dataset/test")

# change directory
setwd("UCI HAR Dataset")

# understand the dataset
system("more README.txt")
# note: selected results from above command:
# - 'train/X_train.txt': Training set.
# - 'train/y_train.txt': Training labels.
# - 'test/X_test.txt': Test set.
# - 'test/y_test.txt': Test labels.
# - 'train/subject_train.txt': Each row identifies the subject who performed the 
#   activity for each window sample. Its range is from 1 to 30.
# - 'test/subject_test.txt': Each row identifies the subject who performed the
#   activity for each window sample. Its range is from 1 to 30.
# decide to use the above data for analysis.

# load data into R
train_data    <- read.table('train/X_train.txt')
train_label   <- read.table('train/y_train.txt')
train_subject <- read.table('train/subject_train.txt')
test_data     <- read.table('test/X_test.txt')
test_label    <- read.table('test/y_test.txt')
test_subject  <- read.table('test/subject_test.txt')

# roughly examine data
head(train_data)
head(train_label)
head(train_subject)
head(test_data)
head(test_label)
head(test_subject)

nrow(train_data)
nrow(train_label)
nrow(train_subject)
nrow(test_data)
nrow(train_label)
nrow(train_subject)

ncol(train_data)
ncol(train_label)
ncol(train_subject)
ncol(test_data)
ncol(test_label)
ncol(test_subject)

# Step 1
# Merge the training and test sets to create one data set
data    <- rbind(train_data, test_data)
label   <- rbind(train_label, test_label)
subject <- rbind(train_subject, test_subject)
nrow(data)
nrow(label)
nrow(subject)

# Step 2
# Extracts only the measurements on the mean and standard deviation for each 
# measurement.
## Relevant info for this task from README.txt:
## - 'features_info.txt': Shows information about the variables used on the 
##   feature vector.
## - 'features.txt': List of all features.
feature <- read.table("features.txt")
nrow(feature)
ncol(feature)
head(feature)
colnames(data) <- feature$V2
head(data)
result <- data[, grep("-(mean|std)\\(\\)", colnames(data))]

# Step 3
# Use descriptive activity names to name the activities in the data set
## Relevant info for this task from README.txt:
## - 'activity_labels.txt': Links the class labels with their activity name.
activity <- read.table('activity_labels.txt')
nrow(activity)
ncol(activity)
head(activity)
label[, 1] <- activity[label[, 1], 2]
colnames(label) <- 'activity'

# Step 4
# Appropriately label the data set with descriptive variable names
colnames(subject) <- 'subject'
all_data <- cbind(data, label, subject)

# Step 5
# Create a second, independent tidy data set with the average of each variable
# for each activity and each subject
install.packages("dplyr")
library(dplyr)
averages_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[,1:561]))
write.table(averages_data, "../averages_data.txt", row.name=FALSE, col.names = TRUE, quote = FALSE)

