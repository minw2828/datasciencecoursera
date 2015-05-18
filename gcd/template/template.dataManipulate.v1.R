# /usr/bin/rscript

## Description:
## This module is a template for getting data from different sources.
## It is obtained from Coursera course <Getting and Cleaning Data> Lecture 
## videos in Week 3.
## 
## It inlcudes functions for the following purposes:
## writeFileRobust     - Write content to a file using write.table method
## 
## Author:
## Min Wang (min.wang@depi.vic.gov.au)
##
## Date Created:
## 18 May 2015
## 
## Date modified and reason: 


dataSubset <- function(df) {
    x[]
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


