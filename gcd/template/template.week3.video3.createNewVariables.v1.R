# create sequences
s1 <- seq(1, 10, by=2)
s1
s2 <- seq(1,10, length=3)
s2
x <- c(1, 3, 8, 25, 100); seq(along=x)# along creates indexes
x

# subset variables
restData$nearMe <- resData$eighbourhood %in% c("Roland Park", "Homeland") # find restaurant in neihbourhood Roland Park and Homeland
table(restDAta$nearMe) # show result in table format

# create binary variables
variable <- ifelse(condition, TRUE, FALSE)
table(variable, condition) # show result in table and count each elements in table

# create categorical variables 
variable <- cut(quantitative_variable, breaks=quantitle()); break the quantitative variable according to given value in break
table(variable) # returns factor variable; count the occurance of an elements within a range

# easier cutting
libray(Hmisc)
variable <- cut2(quantitative_variable, g=4); break into 4 different groups and break according to quantiles
table(variable)

# create factor variables
variable <- factor(quantitative_variable) # tells how many different levels there are within the variable
class(variable) # tell the type of variable, i.e. factor

# levels of factor variables
variable <- sample() # generate samples
variablefac <- factor(variable, levels=c("yes", "no")) # specify levels, lowest here is "yes"
relevel(, ref="yes")
as.numeric(variablefac) # change the level from string to numeric

# using the mutate function
library(Hmisc)
library(plyr)
restData2 <- mutate(restData, zipGroups=cut2(zipCode, g=4)) # create a new variable and add to dataset simultaneously; restData2 is a new data frame here; zipGroups is the new variable added
table(restData$zipGroups); view result in table

# common transforms 
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
