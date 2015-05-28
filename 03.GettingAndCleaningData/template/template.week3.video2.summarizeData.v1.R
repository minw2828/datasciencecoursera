# Get data from the web
if (!file.exists("./data")) {
    dir.create("./data")
}  
fileUrl <- "http://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(url=fileUrl, destfile="./data/restaurants.csv", method="curl")
restData <- read.csv("./data/restaurants.csv")

# Look at a bit of the data
head(restData, n=3) # by default return 6 rows
tail(restData, n=3) # by default return 6 rows

# Make summary
# turns an overall summary of the data frame we have, 
# detail to every single variable – returns interesting and informative
summary(restData) 

# More in depth information
# returns information of the data frame, focus on the type of the variable
str(restData) 

# Quantiles of quantitative variables
quantile(restData$councilDistrict, na.rm=TRUE) 
quantile(restData$councilDistrict, probs=c(0.5, 0.75, 0.9)) # look at probability

# Make table
table(restData$zipCode, useNA="ifany") 
# useNA="ifany" adds missing value to table if there is any
# by default the table() function does not return missing value
table(restData$councilDistrict, restData$zipCode) # returns 2-dimensional table

# Check for missing values
# checks for missing value; 0: not missing; 1: missing
sum(is.na(restData$councilDistrict)) 
# looks thought the entire set of value; return TRUE or FALSE
any(is.na(restData$councilDistrict)) 
# checks and sees if every value satisfies the condition; return TRUE or FALSE
all(restData$zipCode > 0) 

# Row and column sums
colSums(is.na(restData))
all(colSums(is.na(restData)))
rowSum() # return literally what the name is

# Values with specific characteristics
table(restData$zipCode %in% c("21212")
# asks are there any variables equalling to either value 
# “21212” or “21213” and lists the results in a table
table(restData$zipCode %in% c("21212", "21213"))
# a logical variable to subset the dataset; row sub-setting 
# and returns the rows fulfilling the conditions 
table(restData$zipCode %in% c("21212", "21213"),)

# Cross tabs
data(UCBAdmissions) # loading UCBAdmission dataset
DF <- as.data.frame(UCBAdmissions)
summary(DF)
xt <- xtabs(Freq ~ Gender + Admit, data=DF) # cross tabs; freq is of interest 
xt

# Flat tables
warpbreaks$replicate <- rep(1:9, len=54)
xt <- xtabs(breaks ~., data=warpbreaks)
xt
ftable(xt) # summary the data in a more compact form

# Size of a data set
fakeData = rnorm(1e5)
object.size(fakeData) # sees the size of the data
print(object.size(fakeData), units=”Mb”) # sees sizes in the desired scale
# the above are basic checks for a cleaned data

