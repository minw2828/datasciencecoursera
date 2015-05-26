# start with reshaping
library(reshape2)
head(mtcars) # mtcars is a built-in tester dataset

# melt the data frames
# use the melt() function which assigs which variables are id variables and which variables are measure variables as follow:
mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars, id=c("carname", "gear", "cyl"), measure.vars=c("mpg", "hp"))
head(carMelt, n=3)
tail(carMelt, n=3)
# after reshape the data is tidy and skinny. The residuals are removed.

# cast data frames, i.e. reformat the dataset into different shapes
# the dcast() function below will recast the dataset into a particular shape	and into a particular data frame
cylData <- dcast(carMelt, cyl ~ variable) 
cylData # summarize the dataset and tells how many measures we have for each variable
cylData <- dcast(carMelt, cyl ~ variable, mean) # tell it to calculate the mean for each value
cylData

# averaging values
head(InsectSprays) # view data
# within each InsectSprays$spray, sum InsectSprays$count; a brief short-hand way to calculate those sums
tapply(InsectSprays$count, InsectSprays$spray,sum) 

# another way - split, apply, combine
# the following command split the InsectSprays$count by InsectSprays$spray and ends up a list of arrays
spIns <- split(InsectSprays$count, InsectSprays$spray) 
spIns
# then we sum the elements in each array
sprCount <- lapply(spIns, sum)
sprCount
# then we combine the results from a list of arrays into one variable
unlist(sprCount)
# or use sapply which do both apply and combine 
sapply(spIns, sum)

# another way - plyr package
# plyr provides nice function to do multiple things into one step
ddply(InsectSpray,.(spray), summarize, sum=sum(count))
# spray is the variables that we would like to summarize
# .(spray) is the syntax for doing such a job
# summarize tells what we want to do, i.e. summary spray
# sum=sum(count) tells how we want to do it, i.e. we want to sum by count

# create a new variable
# in this case a new column has been added into dataset and all spray has the same value has been assigned to the same sum value, which is the average of what's inside ()
# add a new column as such has an advantage of adding info we want into dataset so it'll be convenient for future reusage
spraySums <- ddply(OmsectSpray,.(spray), summarize, sum=ave(count, FUN=sum))
dim(spraySums) # retrieves the dimension of the object 

acast() # cast as multi-dimensional arrays
arrange() # fast reordering without using order() commands
mutate() # add new variables
