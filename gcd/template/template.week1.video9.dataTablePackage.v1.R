# data.table 
# Inherets from data.frame
#   - All functions that accept data.frame work on data.table
# Written in C, so it is much faster
# Much, much faster at subsetting, group, and updating

library(data.table)

# Create data table just like data frames
DF <- data.frame(x=rnorm(9), y=rep(c("a","b","c"),each=3), z=rnorm(9))
head(DF, 3)
DT <- data.table(x=rnorm(9), y=rep(c("a","b","c"),each=3), z=rnorm(9))
head(DT, 3)

# See all the data tables in memory
tables()

# Subsetting rows, same as data frames
DT[2, ]
DT[DT$y=="a", ]
# one thing different, when subset with only one element, it subset the rows
DT[c(2,3)]

# Subset columns - Must use expression
# the subsetting function is modified for data.table
# the argument you pass after the comma is called an "expression"
# in R, an expression is a collection of statements enclosed in curley brackets
{
  x = 1
  y = 2
}
k = {print(10); 5}
print(k)

# Calculating values for variables with expressions
DT[, list(mean(x),sum(z))]
DT[, table(y)]

# Add new columns
# very fast
DT[, w:=z^2]
# Careful, in this case, DT2 is changed as well
DT2 <- DT
DT[, y:=2]
head(DT, n=3)
head(DT2, n=3)
# Use copy() function; then DT2 won't be changed if DT is changed

# Multiple operations
DT[, m:={tmp<-(x+z); log2(tmp+5)}]

# plyr like operations
DT[, a:=x>0]
DT[, b:=mean(x+w), by=a]

# Special variables
# .N: An integer, length 1, containing the number r
set.seed(123)
DT <- data.table(x=sample(letters[1:3], 1E5, TRUE))
DT[, .N, by=x]

# Keys 
DT <- data.table(x=rep(c("a","b","c"),each=100),y=rnorm(300))
setkey(DT, x)
DT['a']

# Joins
# merge on common keys
DT1 <- data.table(x=c('a','a','b','dt1'),y=1:4)
DT2 <- data.table(x=c('a','b','dt2'),z=5:7)
setkey(DT1,x); setkey(DT2,x)
merge(DT1, DT2)

# Fast reading with fread()
big_df <- data.frame(x=rnorm(1E6), y=rnorm(1E6))
file <- tempfile()
write.table(big_df, file=file, row.names=FALSE, col.names=TRUE, sep="\t", quote=FALSE)
system.time(fread(file))
system.time(read.table(file, header=TRUE, sep="\t"))


