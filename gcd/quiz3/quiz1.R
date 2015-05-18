# /usr/bin/rscript

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

result <- function() {
    url_link <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
    raw_file <- downloadFileFromWeb(url_link, '.', 'ques1.raw_data.csv')
    data     <- read.table(raw_file, sep=",", header=TRUE)
    agricultureLogical <- data$ACR >= 3 & data$AGS >= 6
    row.names(head(data[which(agricultureLogical),],3))
}


