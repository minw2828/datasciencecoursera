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

# arrange() reorders rows of a data frame, based on the value of a column
chicago <- arrange(chicago, date) # sort in increasing order
chicago <- arrange(chicago, desc(date)) # sort in decreasing order

# rename() renames variables in a data frame
chicago <- rename(chicago, pm25=pm25tmean2, dewpoint=dptp)

# mutate() adds new variables/columns or transform existing variables
chicago <- mutate(chicago, pm25detrend=pm25-mean(pm25, na.rm=TRUE))

# summarize() generates summary statisitcs of different variables in the data frame, possibly within strata
# strata, plural of stratum: a layer or a series of layers of rock in the ground.
chicago <- mutate(chicago, tempcat=factor(1*(tmpd > 80), labels=c("cold", "hot")))
hotcold <- group_by(chicago, tempcat)
summarize(hotcold, pm25=mean(pm25, na.rm=TRUE), o3=max(o3tmean2), no2=median(no2tmean2))
#na.rm=TRUE ignores missing value

chicago <- mutate(chicago, year=as.POSIXlt(date)$year+1900)
years <- group_by(chicago, year)
summarize(years, pm25=mean(pm25, na.rm=TRUE), o3=max(o3tmean2), no2=median(no2tmean2))

# dplyr allows to train different operators together
# pipeline operator syntax: %>%
chicago %>% mutate(month=as.POSIXlt(date)$mon+1) %>% group_by(month) %>% summarize(pm25=mean(pm25, na.rm=TRUE), o3=max(o3tmean2), no2=median(no2tmean2)
# no need to input chicago as first input parameter

