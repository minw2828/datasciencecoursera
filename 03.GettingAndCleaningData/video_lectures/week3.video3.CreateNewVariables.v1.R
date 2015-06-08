# Why create new variables?
# - Often the raw data won't have a value you are looking for
# - You will need to transform the data to get the values you would like
# - Usually you will add those values to the data frames you are working with
# - Common variables to create
#   - Missingness indicators
#   - "Cutting up" quantitative variables
#   - Applying transforms

# Get the data from the web
if (!file.exists("./data")) {
    dir.create("./data")
}
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(url=fileUrl, destfile="./data/restaurants.csv", method="curl")
restData <- read.csv("./data/restaurants.csv")

# Create sequences
s1 <- seq(1, 10, by=2); s1
s2 <- seq(1,10, length=3); s2
x <- c(1, 3, 8, 25, 100); seq(along=x)# along creates indexes
x

# Subset variables
# find restaurant in neihbourhood Roland Park and Homeland
restData$nearMe <- resData$eighbourhood %in% c("Roland Park", "Homeland") 
table(restDAta$nearMe) # show result in table format

# Create binary variables
restData$zipWrong <- ifelse(restData$zipCode < 0, TRUE, FALSE)
table(restData$zipWrong, restData$zipCode < 0) # show result in table and count each elements in table

# Create categorical variables / quantitative variables
# break the quantitative variable according to given value in break
restData$zipGroups <- cut(restData$zipCode, breaks=quantitle(restData$zipCode)); 
table(restData$zipGroups) # returns factor variable; count the occurance of an elements within a range
table(restData$zipGroups, restData$zipCode)

# Easier cutting
library(Hmisc)
# break into 4 different groups and break according to quantiles
restData$zipGroups <- cut2(restData$zipCode, g=4)
table(restData$zipGroups)

# Create factor variables
restData$zcf <- factor(restData$zipCode) # tells how many different levels there are within the variable
restData$zcf[1:10]
class(restData$zcf) # tell the type of variable, i.e. factor

# Levels of factor variables
yesno    <- sample(c("yes", "no"), size=10, replace=TRUE) # generate samples
yesnofac <- factor(yesno, levels=c("yes", "no")) # specify levels, lowest here is "yes"
relevel(yesnofac, ref="yes")
as.numeric(yesnofac) # change the level from string to numeric

# Cutting produces factor variables
library(Hmisc)
restData$zipGroups <- cut2(restData$zipCode,g=4) 
table(restData$zipGroups)

# Using the mutate function
library(Hmisc)
library(plyr)
# create a new variable and add to dataset simultaneously; restData2 is a new data frame here; zipGroups is the new variable added
restData2 <- mutate(restData, zipGroups=cut2(zipCode, g=4)) 
# view result in table
table(restData$zipGroups)

# Common transforms 
abs(x) # absolute value
sqrt(x) # square root
ceiling(x) # ceiling(3.475) == 4
floor(x) # floor(3.475) == 3
round(x, digits=n) # round numbers to n digits after
signif(x, digits=n) # round significant digits to what I like
cos(x); six(x)
log(x) # natural logarithm
log2(x) # other comman logs
exp(x) # exponentiating x


