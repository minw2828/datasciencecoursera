# fix character vectors - tolower(), toupper()
tolower(names(cameraData))

# fix character vectors - strsplit()
# good for automatically split variable names
slitNames <- strsplit(names(cameraData), "\\.")
slitNames[[5]]
slitNames[[6]]

# quick aside - lists
mylist <- list(letter=c("A", "b", "c"), numbers=1:3, matrix(1:25, ncol=5))
head(mylist)
mylist[1]
mylist$letters
mylist[[1]]

# fix character vectors - sapply()
# apply a function to each element in a vector or list
slitNames[[6]][1]
splitNames[[6]][1]
firstElement <- function(x){x[1]}
sapply(splitNames, firstElement)

# fix character vectors - sub()
# i.e. replace() function in Python
sub("_", "", names(reviews),)

# fix character vectors - gsub()
# replace multiple instances of a particular character
testName <- "this_is_a_test"
sub("_", "", testName)
gsub("_", "", testName)

# find values - grep(), grepl()
grep("Alameda", cameraData$intersection)
table(grepl("Alameda", cameraData$intersection))
cameraData2 <- cameraData[!grepl("Alameda", cameraData$intersection),]
grep("Alameda", cameraData$intersection, value=TRUE)
grep("JeffStreet", cameraData$intersection)
# if interger(0) is returned, it means no string match the above grep() function
length(grep("JeffStreet", cameraData$intersection))

# More useful string functions
library(stringr)
nchar("Jeffrey Leek") # calculate the number of strings
substr("Jeffrey Leek", 1, 7) # subset the string by starting character index and end character index
paste("Jeffrey", "Leek", sep=" ") # put two strings into one
paste0("Jeffrey", "Leek") # no space in between
str_trim("Jeff           ") # like strip() in Python

# Important points about text in data sets
# Names of the variables should be
# - All lower case when possible
# - Descriptive(Diagnosis versus Dx)
# - Not duplicated
# - Not have underscores or dots or white spces
# variables with character values
# - Should usually be made into factor variables (depends on application)
# - Should be descriptive (use TRUE/FALSE instead of 0/1 and Male/Female versus 0/1 or M/F)
