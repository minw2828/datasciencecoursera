# 
# Download the file to load
if (!file.exists("data")) {
    dir.create("data")
}
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD"
download.file(url=fileUrl, destfile="./data/cameras.xlsx", method="curl")
dateDownloaded <- date()

# read.xlsx(), read.xlsx2() {xlsx package}
library(xlsx)
cameraData <- read.xlsx("./data/cameras.xlsx", sheetIndex=1, header=TRUE)
head(cameraData)

# Read specific rows and columns
colIndex <- 2:3
rowIndex <- 1:4
cameraDataSubset <-  read.xlsx("./data/cameras.xlsx", sheetIndex=1, header=TRUE, colIndex=colIndex, rowIndex=rowIndex)
cameraDataSubset


