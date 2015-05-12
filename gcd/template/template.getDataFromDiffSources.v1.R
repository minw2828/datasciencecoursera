# /usr/bin/rscript

## Description:
## This module is a template for getting data from different sources.
## It is obtained from Coursera course <Getting and Cleaning Data> Lecture 
## videos in Week 2.
## 
## It inlcudes functions for the following purposes:
## readMysqlDb         - Read an enquiry a table via MySQL database
## readHdf5File        - 
## createGroups
## writeGroups 

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
## 11 May 2015
## 
## Date modified and reason: 


readMysqlDb <- function(user, database, host_url, tableName) {
    ## Note: This function is tested working well on 8 May 2015.
    ## > readMysqlDb("genome", "hg19", "genome-mysql.cse.ucsc.edu", "affyU133Plus2")
    if (!require(RMySQL)) { 
        install.packages("RMySQL")
    }
    library(RMySQL)
    # dbConnect can be used to connect other databases than MySQL()       
    # The following commands show avaiable databases in the server
    # ucscDb <- dbConnect(MySQL(), user=user, host=host_url)
    # result <- dbGetQuery(ucscDb, "show databases;")
    # dbDisconnect(ucscDb)
    # The following commands connect to a particular database
    db <- dbConnect(MySQL(), user=user, db=database, host=host_url)
    allTables <- dbListTables(db)
    length(allTables)
    allTables[1:5]# list the first five tables
    # get dimensions of a specific table; field==column name
    dbListFields(db, tableName) 
    # get the total number of rows in the table
    # note: paste("select count(*) from", tableName, sep=" ") returns a true MySQL command parsing to databse
    dbGetOuery(db, paste("select count(*) from", tableName, sep=" ")) 
    # read from a specific table
    data <- dbReadTable(db, tableName)
    head(data)
    # select a specific subset
    # again, paste() returns a true MySQL command
    query <- dbSendQuery(db, paste("select * from", tableName, "where misMatches between 1 and 3", sep=" "))
    query_answer1 <- fetch(query)
    quantile(query_answer1$misMatches)
    query_answer2 <- fetch(query, n=10) # only brings back the top 10 rows
    dbClearResult(query) # should return TRUE; a bit like f.close()
    dim(query_answer2)
    # Always remember to close the connection
    dbDisconnect(db) 
    return()
}

readHdf5File <- function(filename) {
    ## Note: This function is tested fine on 11 May 2015
    ## > readHdf5File("example.h5")
    ## [1] TRUE
    # install R HDF5 package from Bioconductor http://bioconductor.org/
    # which is primarily used for genomics but also has good "big data" packages
    if (!require(rhdf5)) {
        source("http://bioconductor.org/biocLite.R")
        biocLite("rhdf5") 
    }
    library(rhdf5)
    created = h5createFile(filename)
    return(created)
}

createGroups <- function(filename, main_group, sub_group) {
    ## Note: This function is tested fine on 11 May 2015
    ## > createGroups("example.h5", "foo", "foobaa")
    ## > createGroups("example.h5", "foo", "foobaa")
    ##  group   name     otype dclass dim
    ## 0     /    foo H5I_GROUP
    ## 1  /foo foobaa H5I_GROUP
    created = h5createGroup(filename, main_group)
    created = h5createGroup(filename, paste(main_group, sub_group, sep="/"))
    return(h5ls(filename)) # list out all components under this filename
}

writeGroups <- function(filename, content, group_name) {
    ## Note: This function is tested fine on 11 May 2015
    ## > matrix_A <- matrix(1:10, nr=5, nc=2)
    ## > writeGroups("example.h5", matrix_A, "foo/A")
    ##   group   name       otype  dclass   dim
    ## 0     /    foo   H5I_GROUP
    ## 1  /foo      A H5I_DATASET INTEGER 5 x 2
    ## 2  /foo foobaa   H5I_GROUP 
    # content can be a matrix or an array
    # if the content is a matrix
    h5write(content, filename, group_name) # use index parameter to specify where to write
    # if the content is an array
    # attr(content, "scale") <- "liter"
    # h5write(content, filename, group_name)
    return(h5ls(filename))
}

writeDataSet <- function(df, filename, dataset_name) {
    ## > df <- data.frame(1L:5L, seq(0,1,length.out=5), c("ab", "cde", "fghi", "a", "b"), stringAsFactors=FALSE)
    ## > writeDataSet(df, "example.h5", "df")
    ## Error in h5writeDataset.data.frame(obj, loc$H5Identifier, name, ...) :
    ## Cannot write data.frame. Object already exists. Subsetting for compound datatype not supported.
    h5write(df, filename, dataset_name)
    return(h5ls(filename))
}

readData <- function(filename, group_name) {
    ## Note: This function is tested fine on 11 May 2015
    ## > readData("example.h5", "foo/A") 
    ##          [,1] [,2]
    ## [1,]    1    6
    ## [2,]    2    7
    ## [3,]    3    8
    ## [4,]    4    9
    ## [5,]    5   10
    readA  <- h5read(filename, group_name)
    return(readA)
}

readDataByDatasetName <- function(filename, dataset_name) {
    ## Note: This function is tested fine on 11 May 2015
    ## > readDataByDatasetName("example.h5", "df")
    ##   X1L.5L seq.0..1..length.out...5. c..ab....cde....fghi....a....b..
    ## 1      1                      0.00                                2
    ## 2      2                      0.25                                4
    ## 3      3                      0.50                                5
    ## 4      4                      0.75                                1
    ## 5      5                      1.00                                3
    readdf <- h5read(filename, dataset_name)
    return(readdf)
}

readHtmlFile <- function(url_link) {
    ## Note: This function is tested fine on 11 May 2015
    ## > url_link <- "https://scholar.google.com/citations?user=HI-I6C0AAAAJ"
    ## > readHtmlFile(url_link)
    ## [1] "Jeff Leek - Google Scholar Citations"
    # use GET from the httr package
    if (!require(httr)) {
        install.packages("httr")
    }
    library(httr)
    html2      <- GET(url_link)
    con        <- content(html2, as="text")
    parsedHtml <- htmlParse(con, asText=TRUE)
    result     <- xpathSApply(parsedHtml, "//title", xmlValue)
    return(result)
}

accessWebWithPasswords <- function(url_link, username, password) {
    ## Note: This function is tested fine on 11 May 2015
    ## > url_link <- "https://github.com/"
    ## > username <- "san-heng-yi-shu@163.com"
    ## > password <- "" # real password
    ## > accessWebWithPasswords(url_link, username, password)
    ## [1] "url"         "status_code" "headers"     "all_headers" "cookies"
    ## [6] "content"     "date"        "times"       "request"
    pg <- GET(url_link, authenticate(username, password))
    return(names(pg))
    # Note: use handle can save username and password so that no need to retype
}

accessApplicationFromR <- function(app_name, url_link, username, password) {
    ## > accessApplicationFromR("twitter", )
    myapp <- oauth_app("twitter", key="")
    return()
}


