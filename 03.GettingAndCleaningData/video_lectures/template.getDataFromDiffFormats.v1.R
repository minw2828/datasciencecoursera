# /usr/bin/rscript

## Description:
## This module is a template for getting data from different formats. 
## It is obtained from Coursera course <Getting and Cleaning Data> Lecture 
## videos in Week 1.
## 
## It inlcudes functions for the following purposes:
## downloadFileFromWeb - Download a file from a website
## readFileRobust      - Read a file in the robustest way using read.table method
## readExcelFile       - Read a MS Excel spreadsheet     
## readXmlFromWeb      - Read a XML file from a website
## readJsonFromWeb     - Read a JSON(Javascript Object Notation; Common format for APIs) file
## dataFrames2Json     - Load data frame to JSON
## json2DataFrame      - Load JSON to data frame
## readDataTable       - Read a file using data.table method; Great for reading big data
## writeExcelFile      - Write content to a MS Excel spreadsheet
## writeFileRobust     - Write content to a file using write.table method
## 
## Author:
## Min Wang (min.wang@depi.vic.gov.au)
##
## Date Created:
## 6 May 2015
## 
## Date modified and reason: 


downloadFileFromWeb <- function(url_link, dest_dir, dest_file) {
    ## Note: This function is tested working well on 6 May 2015.
    ## > downloadFileFromWeb("https://d396qusza40orc.cloudfront.net/getda.csv", ".", "ques1.raw_data.csv")
    ## [1] "File url link is: https://d396qusza40orc.cloudfront.net/getda.csv"
    ## [1] "Date of download is: Wed May  6 11:36:30 2015"
    ## [1] "./ques1.raw_data.csv"
    # check if working directory exists and if it doesn't exist, create one
    if (! file.exists(dest_dir)) {
            dir.create(dest_dir)
        }
    # download a file from the internet
    download.file(url=url_link, destfile=dest_file, method="curl")
    # record the date that the file is downloaded, to keep track in the future 
    # if the file on the internet has been changed or not over time
    dataDownloaded <- date()
    filename <- paste(dest_dir, dest_file, sep='/')
    if (file.exists(filename)) {
        print(paste("File url link is:", url_link, sep=" "))
        print(paste("Date of download is:", dataDownloaded))
        return(filename)
    } else {
        stop(paste("Error: Fail to download file from:", url_link, sep=" "))
    }
}

readFileRobust <- function(filename) {
    ## Note: This function is tested working well on 6 May 2015.
    ## > readFileRobust("./ques1.raw_data.csv")
    ## ...
    ##                                                      H,1357880,8,00500,4,16,1015675,0123,02,1,2,1,1,02,2,,140,
    ## ...
    # read table in the most robust way which allows the largest flexibility
    # file_content <- read.table(file=filename)
    # read table in a more precise way. You may want to adjust the parameters 
    file_content <- read.table(file=filename, header=FALSE, sep=",", quote="", row.names=1, na.strings="NA")
    return(file_content)
}

readExcelFile <- function(filename) {
    ## Note: This function is tested working well on 6 May 2015.
    ## > readExcelFile("./ques1.raw_data.xlsx")
    if (!require(xlsx)) {
        install.packages(library(xlsx))
    }
    library(xlsx)
    # XLConnect package has more advanced features
    # XLConnect vignette is its manual
    # if (!require(XLConnect)) {
        #install.packages("XLConnect", dependencies=TRUE)
    # }
    # library(XLConnect)
    # read Excel spreadsheet 1 in a robust way
    data <- read.xlsx(filename, sheetIndex=1, header=TRUE)
    # read Excel spreadsheet 1 specific rows and columns
    # data <- read.xlsx(filename, sheetIndex=1, header=TRUE, colIndex=2:3, rowIndex=1:4)
    return(data)
}

readXmlFromWeb <- function(url_link) {
    ## Note: This function is tested working well on 7 May 2015.
    ## > url_link <- "http://www.w3schools.com/xml/note.xml"
    ## > readXmlFromWeb(url_link)
    if (!require(XML)) {
        install.packages(library(XML))
    }
    library(XML)
    doc      <- xmlTreeParse(url_link, useInternal=TRUE) # parse file; use useInternal=TRUE so you can get all context inside that file
    rootNode <- xmlRoot(doc) # get the root out
    xmlName(rootNode) # get the root name
    a <- rootNode[[1]] # directly access parts of the XML document in level 1
    b <-rootNode[[1]][[1]] # directly access parts of the XML document in level 1.1
    c <- xmlSApply(rootNode, xmlValue) # programatically extract parts of the file; xmlVaue is a function to get every single value inside rootNode and will return all the text inside the document
    d <- xpathSApply(rootNode, "//name", xmlValue) # get more specific item from document, in this case, value inside <name> tag
    return()
}

readJsonFromWeb <- function(url_link) {
    ## Note: This function is tested working well on 7 May 2015.
    ## > url_link <- "http://www.w3schools.com/xml/note.xml"
    ## > readJsonFromWeb(url_link)
    if (!require(jsonlite)) {
        install.packages(library(jsonlite))
    }
    library(jsonlite)
    jsonData <- fromJSON(url_link)
    names(jsonData)
    names(jsonData$owner)
    jsonData$owner$login
    return()
}

dataFrames2Json <- function(df) {
    ## Note: This function is tested working well on 7 May 2015.
    myjson <- toJSON(df, pretty=TRUE) # pretty=TRUE makes the data frame nicely formatted and easy to read
    return(myjson)
}

json2DataFrame <- function(myjson) {
    ## Note: This function is tested working well on 7 May 2015.
    df <- fromJSON(myjson)
    return(df)
}

readDataTable <- function(filename) {
    if (!require(data.table)) {
        install.packages(library(data.table))
    }
    library(data.table)
    return(fread(filename))
}


writeExcelFile <- function(filename, filecontent) {
    ## Note: This function is tested working well on 6 May 2015.
    ## > writeExcelFile("./output.xlsx", "1. test to write to excel.")
    if (!require(xlsx)) {
        install.packages(library(xlsx))
    }
    library(xlsx)
    # XLConnect package has more advanced features
    # XLConnect vignette is its manual
    # if (!require(XLConnect)) {
        #install.packages("XLConnect", dependencies=TRUE)
    # }
    # library(XLConnect)
    write.xlsx(x=filecontent, file=filename, sheetName="Sheet1", col.names=TRUE, row.names=TRUE, append=FALSE, showNA=TRUE)
}

writeFileRobust <- function(df, filename) {
    write.table(df, file=filename, sep = ",", append = FALSE, row.names=TRUE, col.names=NA)
}

