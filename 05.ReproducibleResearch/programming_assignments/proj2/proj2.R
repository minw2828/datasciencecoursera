# /usr/bin/rscript

## Coursera Data Science Certificates
## by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD
## Johns Hopkins University
##
## 05. Reproducible Research 
##
## Course Project 2
##
## Data
## Storm Data:
## https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2
## Storm Data documentation:
## https://d396qusza40orc.cloudfront.net/repdata%2Fpeer2_doc%2Fpd01016005curr.pdf
##
## Author:
## Min Wang (min.wang@ecodev.vic.gov.au)
##
## Date Created:
## 07 August 2015
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
library(reshape2)


download.file("https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2",
              "storm_data.csv.bz2", method="curl")
system("bunzip2 storm_data.csv.bz2")
unlink("storm_data.csv.bz2")

data <- read.csv("storm_data.csv")
dim(data)
head(data)


## Questions 1
## Across the United States, which types of events (as indicated in the EVTYPE 
## variable) are most harmful with respect to population health?
answer_1    <- ddply(data, .(EVTYPE), summarise, total_fatality=sum(FATALITIES, na.rm=TRUE), total_injuries=sum(INJURIES, na.rm=TRUE))
table_1     <- answer_1[with(answer_1, order(total_fatality, total_injuries, decreasing=TRUE)), ]
head(table_1)

## Question 2
## Across the United States, which types of events have the greatest economic 
## consequences?
answer_2 <- ddply(data, .(EVTYPE), summarise, total=sum(PROPDMG+CROPDMG, na.rm=TRUE))
table_2 <- answer_2[with(answer_2, order(total, decreasing=TRUE)), ]
ggplot(table_2[1:10, ], aes(x=EVTYPE, y=total)) + geom_bar(stat="identity") + labs(title = "Economic Loss") + labs(x = "Event") + labs(y = "Billion Dollars") + theme(plot.title = element_text(lineheight=.8, face="bold"), axis.text.x=element_text(angle=45,vjust=1,hjust=1))

