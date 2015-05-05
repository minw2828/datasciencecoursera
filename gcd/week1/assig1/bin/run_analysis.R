# /usr/bin/rscript

## Description:
## This module does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each 
##    measurement. 
## 3. Uses descriptive activity names to name the activities in the data set.
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set 
##    with the average of each variable for each activity and each subject.
## 
## Output Requirements:
## 1. Please upload the tidy data set created in step 5 of the instructions. 
## 2. Please upload your data set as a txt file created with write.table() using 
##    row.name=FALSE (do not cut and paste a dataset directly into the text box, 
##    as this may cause errors saving your submission).
##
## <INPUT_FILE1>:
## <INPUT_FILE2>:
## <OUTPUT_FILE1>:
## <OUTPUT_FILE2>:
##
## Author:
## Min Wang (min.wang@depi.vic.gov.au)
##
## Date Created:
## 2015
## 
## Date modified and reason: 
##
## Execution: 
## Rscript <MODULE_NAME> <INPUT_FILE1> <INPUT_FILE2> <LOG_FILE> <OUTPUT_FILE1> <OUTPUT_FILE2>


library(methods)

args           <- commandArgs(trailingOnly=TRUE)
INPUT_FILE1    <- args[1] # a URL link to file download. e.g. https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
INPUT_FILE2    <- args[2] 
LOG_FILE       <- args[3]
OUTPUT_FOLDER1 <- args[4]
OUTPUT_FILE2   <- args[5]

download_file <- function(url_link, outfolder) {
    zip_file<- download.file(url_link, outfolder)
    return(zip_file)
}

extract_zipfile <- function(zipfile, outfolder) {
    unzip_file<- unz(outfolder, zipfile) # unz: Functions to create, open and close connections.
    return(unzip_file)
}

read_file <- function(filename) {
    file_content <- read.table(filename)
    return(file_content)
}

result <- function() {
    ZIP_FILE   <- download_file(INPUT_FILE1, OUTPUT_FOLDER1)
    UNZIP_FILE <- extract_zipfile(ZIP_FILE, OUTPUT_FOLDER1)
    DATA       <- read_file(UNZIP_FILE)
    return(DATA) 
}

merge_files <- function(fc1, fc2, cn1, cn2){
    if ( nrow(fc1) != nrow(fc2) ) {
        warning("Unequal row length in input files.")
    }
    mt <- merge(fc1, fc2, by = "row.names", all=TRUE)
    df <- as.matrix(mt[,-1], row.names=1, nrow = nrow(mt), ncol = 2, byrow=TRUE)
    rownames(df) <- rownames(fc1)
    colnames(df) <- c(cn1, cn2)
    return(df)
}

plot_graph <- function(df, format, pic_name, main_header, sub_header) {
    outputfile=paste(pic_name, '.', toString(format), sep='')
    if ( format == "pdf" ){
        pdf(outputfile)
    }
    else if ( format == "png" ){
        png(outputfile)
    }
    else if ( format == "jpeg" ){
        jpeg(outputfile)
    }
    else if ( format == "wmf" ){
        win.metafile(outputfile)
    }
    else if ( format == "bmp" ) {
        bmp(outputfile)
    }
    else if ( format == "ps" ) {
        postscript(outputfile)
    }
    else {
        warning("Unknown graphic file format.")
    }
    a1  <- min(df[,1])-1
    b1  <- max(df[,1])+1
    a2  <- min(df[,2])-1
    b2  <- max(df[,2])+1
    if( missing(sub_header) ) { 
            plot(df, xlab="measured RFI", ylab="predicted RFI", main=main_header, xlim=c(a1, b1), ylim=c(a2, b2), pch = 19)
        } else {
            plot(df, xlab="measured RFI", ylab="predicted RFI", main=paste(main_header, sub_header, sep='\n'), xlim=c(a1, b1), ylim=c(a2, b2), pch = 19)
        }   
    text(df, labels=rownames(df), pos=3)
    abline(a=0, b=1, h=0, v=0, col='lightgray')
    dev.off()
}

write_file <- function(df, filename) {
    write.table(df, file=filename, sep = ",", append = FALSE, row.names=TRUE, col.names=NA)
    }

write_log <- function() {
    write(paste(args, sep =" "), file=LOG_FILE, append=TRUE)
    write(paste('[Time Usage:', proc.time()[3], 'seconds]', sep=' '), file=LOG_FILE, append=TRUE)
    write(paste('[Memory Peak Usage:',gc()[2,6],'MB]', sep=' '), file=LOG_FILE, append=TRUE)
}

# run
result()
write_log()
