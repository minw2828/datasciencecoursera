library(dplyr)
# select() function returns a subset of the columns of a data frame
chicago <- readRDS("chicago.rds") # web download dataset
dim(chicago)
# str() Compactly display the internal *str*ucture of an R object, a diagnostic function and an alternative to ‘summary’ (and to some extent, ‘dput’).
str(chicago)
names(chicago)
head(select(chicago, city:dptp)) # directly use the column name
head(select(chicago, -(city:dptp))) # view column EXCEPT those in range

# filter() function extracts a subset of rows from a data frame based on logical conditions
chic.f <- filter(chicago, pm25tmean2 > 30)
head(chic.f, 10)
chic.f <- filter(chicago, pm25tmean2 > 30 & tmpd > 80)


arrange() # reorder rows of a data frame
rename() # rename variables in a data frame
mutate() # add new variables/columns or transform existing variables
summarize() # generate summary statisitcs of different variables in the data frame, possibly within strata
# strata, plural of stratum: a layer or a series of layers of rock in the ground.


