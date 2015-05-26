head(); tail() # command by default return 6 rows
summary() # turns an overall summary of the data frame we have, detail to every single variable – returns interesting and informative 
str() # returns information of the data frame, focus on the type of the variable
quantile() # looks at variability 
quantile(, probs=()) # look at probability
table() # make table
table(, useNA=”ifany”) # add missing value to table if there is any, because by default the table() function does not return missing value
table(variable1, variable2) # returns 2-dimensional table
is.na() # checks for missing value; 0: not missing; 1: missing
any() # looks thought the entire set of value 
all() # checks and sees if every value satisfies the condition
colSums(); rowSum() # return literally what the name is
table(df$variable %in% c(“21212”, “21213”)) # asks are there any variables equalling to either value “21212” or “21213” and lists the results in a table
df[df(df$variable %in% c(“21212”, “21213”)), ] # a logical variable to subset the dataset; row sub-setting and returns the rows fulfilling the conditions
data(UCBAdmissions) # loading UCBAdmission dataset
xtabs(freq ~ gender + admit, data=DF) # cross tabs; freq is of interest 
ftable(xt) # summary the data in a more compact form
object.size() # sees the size of the data
print(object.size(df), units=”MB”) # sees sizes in the desired scale
# the above are basic checks for a cleaned data
