# Download the file to load
if (!file.exists("data")) {
    dir.create("data")
} 
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(url=fileUrl, destfile="cameras.csv", method="curl")
dateDownloaded <- date()

# Load flat files - read.table()
# this is the main function for reading data into R
# flexible and robust but requires more parameters
# reads the data into RAM - big data can cause problems
cameraData <- read.table("./data/cameras.csv") 
# the above command generates error: line 1 did not have 13 elements 
# reason: by default read.table looks for tab-delimited 
# solution:
cameraData <- read.table("./data/cameras.csv", sep=",", header=TRUE)
head(cameraData)

# read.csv sets sep="," and header=TRUE
cameraData <- read.csv("./data/cameras.csv")
head(cameraData)

# Some more important parameters
# quote      - tell R whether there are any quoted values 
#              quote="" means no quotes
# na.strings - set the character that represents a missing value
# nrows      - how many rows to read of the file 
#              (e.g. nrows=10 reads 10 lines)
# skip       - number of lines to skip before starting to read
# In the lecturer's experience, the biggest trouble with reading flat 
# files are quotation marks ` or " placed in data values, setting quote=""
# often resolves these.


