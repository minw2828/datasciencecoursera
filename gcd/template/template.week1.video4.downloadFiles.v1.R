# Get/set your working directory
# be aware of relative versus absolute paths
# - relative
setwd("./data")
setwd("../")
getwd("../")
# - absolute
setwd("/home/mw1d/coursera/gcd/template")
# in Windows: setwd("c:\\Users\\mw1d\\Downloads")

# Check for and create directories
file.exists("directoryName")
dir.create("directoryName")
if (!file.exists("data")) {
    dir.create("data")
}

# Download a file from the web
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(url=fileUrl, destfile="./data/cameras.csv", method="curl")
list.files("./data")
dateDownload <- date()
dateDownload



