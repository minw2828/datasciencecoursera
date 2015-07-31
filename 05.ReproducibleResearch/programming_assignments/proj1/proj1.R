# /usr/bin/rscript

## Coursera Data Science Certificates
## by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD
## Johns Hopkins University
##
## 05. Reproducible Research 
##
## Course Project 1
##
## Data
## Activity monitoring data [52K]
## https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip
##
## Data Description
## The variables included in this dataset are:
## - steps: Number of steps taking in a 5-minute interval (missing values are 
##          coded as NA)
## - date: The date on which the measurement was taken in YYYY-MM-DD format
## - interval: Identifier for the 5-minute interval in which measurement was 
##             taken
## The dataset is stored in a comma-separated-value (CSV) file and there are a 
## total of 17,568 observations in this dataset.
##
## Assignment
## You will need to write a report that answers the questions detailed below. 
## Ultimately, you will need to complete the entire assignment in a single R 
## markdown document that can be processed by knitr and be transformed into an 
## HTML file.
## 
## - Throughout your report make sure you always include the code that you used 
##   to generate the output you present. 
## - When writing code chunks in the R markdown document, always use echo = TRUE 
##   so that someone else will be able to read the code. 
## - For the plotting aspects of this assignment, feel free to use any plotting 
##   system in R (i.e., base, lattice, ggplot2)
## 
## Fork/clone the GitHub repository created for this assignment. 
## http://github.com/rdpeng/RepData_PeerAssessment1
## You will submit this assignment by pushing your completed files into your 
## forked repository on GitHub. 
## NOTE: The GitHub repository also contains the dataset for the assignment so 
##       you do not have to download the data separately.
##
## Author:
## Min Wang (min.wang@ecodev.vic.gov.au)
##
## Date Created:
## 28 July 2015
##
## Date modified and reason:
##
## Execution:
## Rscript <MODULE_NAME>


library(knitr)
library(data.table)
library(plyr)
library(ggplot2)
library(zoo)
library(scales)
library(Hmisc)


download.file("https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip", 
              "activity_monitoring_data.zip", method="curl")
unzip("activity_monitoring_data.zip")

data <- read.csv("activity.csv")
head(data)
class(data$date)


## Questions 1
## What is mean total number of steps taken per day? 
## For this part of the assignment, you can ignore the missing values in the 
## dataset.
## (1) Calculate the total number of steps taken per day
answer_1_1 <- ddply(data, .(date), summarise, total_step_daily=mean(steps, na.rm=TRUE))
answer_1_1

## (2) Make a histogram of the total number of steps taken each day.
png("answer_1_2.png")
hist(answer_1_1$total_step_daily, main = paste("Histogram of" , "the total number of steps taken each day", sep=" "),
     xlab="the total number of steps taken each day")
dev.off()

## (3) Calculate and report the mean and median of the total number of steps 
##     taken per day
answer_1_3 <- summary(answer_1_1$total_step_daily)
answer_1_3


## Questions 2
## What is the average daily activity pattern?
## (1) Make a time series plot (i.e. type = "l") of the 5-minute interval 
##     (x-axis) and the average number of steps taken, averaged across all 
##     days (y-axis)
answer_2_1 <- ddply(data, .(interval), summarise, average_step_interval=mean(steps, na.rm=TRUE))
answer_2_1
g <- ggplot(answer_2_1, aes(x=interval, y=average_step_interval)) + geom_line() + 
            ggtitle("Time series plot of the 5-minute interval and the average number of steps taken, averaged across all days") + 
            xlab("5-minute interval") + ylab("average number of steps taken")
ggsave(filename="answer_2_1.png", plot=g)

## (2) Which 5-minute interval, on average across all the days in the 
##     dataset, contains the maximum number of steps?
answer_2_2 <- answer_2_1[which.max(answer_2_1$average_step_interval), ]
answer_2_2


## Questions 3
## Imputing missing values 
## Note that there are a number of days/intervals where there are missing values 
## (coded as NA). The presence of missing days may introduce bias into some 
## calculations or summaries of the data.
## (1) Calculate and report the total number of missing values in the dataset (i.e.
##     the total number of rows with NAs)
answer_3_1 <- length(is.na(data$steps))
answer_3_1

## (2) Devise a strategy for filling in all of the missing values in the dataset.
## Imputation Strategy: Use mean steps of the day.
is.na(answer_2_1$average_step_interval)
tmp1 <- as.data.table(data)
tmp2 <- as.data.table(answer_2_1)
setkey(tmp1, interval)
setkey(tmp2, interval)
answer_3_2 <- merge(tmp1, tmp2, all.x=TRUE)
answer_3_2

## (3) Create a new dataset that is equal to the original dataset but with the
##     missing data filled in.
tmp <- as.data.frame(answer_3_2)
answer_3_3 <- tmp[, c(4, 3, 1)]
colnames(answer_3_3) <- colnames(data)
answer_3_3

## (4) Make a histogram of the total number of steps taken each day and Calculate
##     and report the mean and median total number of steps taken per day. Do these
##     values differ from the estimates from the first part of the assignment? What
##     is the impact of imputing missing data on the estimates of the total daily
##     number of steps?
png("answer_3_4.png")
par(mfrow=c(1, 2), mar=c(2, 4, 2, 1), oma=c(2, 0, 2, 0))
subtitle1 <- paste("Median:", answer_1_3[3], "; Mean:", answer_1_3[4], sep="")
hist(answer_1_1$total_step_daily, main=subtitle1)
answer_3_4 <- ddply(answer_3_3, .(date), summarise, total_step_daily=mean(steps, na.rm=TRUE))
tmp <- summary(answer_3_4$total_step_daily)
subtitle2 <- paste("Median:", tmp[3], "; Mean:", tmp[4], sep="")
hist(answer_3_4$total_step_daily, main=subtitle2)
mtext(paste("Histogram of" , "the total number of steps taken each day", sep=" "), 
      outer = TRUE, cex=1.5)
dev.off()
answer_3_4


## Questions 4
## Are there differences in activity patterns between weekdays and weekends?
## For this part the weekdays() function may be of some help here. Use the
## dataset with the filled-in missing values for this part.)
## (1) Create a new factor variable in the dataset with two levels – “weekday” and
##     “weekend” indicating whether a given date is a weekday or weekend day.
answer_4_1 <- answer_3_3
answer_4_1$date <- as.Date(answer_4_1$date, "%Y-%m-%d")
answer_4_1 <- mutate(answer_4_1, date_of_week=weekdays(answer_4_1$date))
answer_4_1 <- mutate(answer_4_1, weekday=as.factor(ifelse(weekdays(answer_4_1$date) %in% c("Saturday", "Sunday"), "weekend", "weekday")))

## (2) Make a panel plot containing a time series plot (i.e. type = "l") of the
##     5-minute interval (x-axis) and the average number of steps taken, averaged
##     across all weekday days or weekend days (y-axis). See the README file in the
##     GitHub repository to see an example of what this plot should look like using
##     simulated data.
answer_4_2 <- ddply(answer_4_1, .(interval, weekday), summarise, average_step_interval=mean(steps, na.rm=TRUE))
g <- ggplot(answer_4_2, aes(x=interval, y=average_step_interval)) + facet_grid(weekday~.) + geom_line(colour="sky blue") +
            xlab("Interval") + ylab("Number of steps taken")
ggsave(filename="answer_4_2.png", plot=g)


