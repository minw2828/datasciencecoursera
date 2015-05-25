# specialize in merging different datasets by identical ids.

# download data 
# read.csv

# merging data - merge()
# important parameters: x, y, by, by.x, by.y, all
names(reviews) # reviews is a df name
# merge x and y datasets by input x ids and y ids and include all data from both x and y. If there is a value only occuring in one dataset but not the other, create a new row that gives a missing value to the one that have no values
mergedData <- merge(reviews, solutions, by.x="solution_id", by.y="id", all=TRUE)
head(mergedData)
# default - merge all common column names
intersect(names(solutions), names(reviews))
mergedData2 <- merge(reviews, solutions, all=TRUE)
head(mergedData2)

# using join in the plyr package
# a bit faster than merge but can only merge files with common names (it seems more accurate to me)
# the commands below create two dfs with common IDs but ID orders are different as it is sampled
df1 <- data.frame(id=sample(1:10), x=rnorm(10))
df2 <- data.frame(id=sample(1:10), y=rnorm(10))
# the following commands first join two dfs by id and then arrange the order of rows by increasing order
arrange(join(df1, df2), id) 
# a benefit of join() command:
# if you have multiple data frames, it's hard to do with merge() but it's easy to do with join_all() as is listed below
df1 <-
df2 <-
df3 <- 
dfList <- list(df1, df2, df3)
join_all(dfList)

