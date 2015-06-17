# /usr/bin/rscript

## Coursera Getting and Cleaning Data
## by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD
## Johns Hopkins University
##
## Question 1
##
## Register an application with the Github API here 
##     https://github.com/settings/applications. 
## Access the API to get information on your instructors repositories (hint: this 
## is the url you want "https://api.github.com/users/jtleek/repos"). Use this data 
## to find the time that the datasharing repo was created. What time was it created? 
## This tutorial may be useful (https://github.com/hadley/httr/blob/master/demo/oauth2-github.r). 
## You may also need to run the code in the base R package and not R studio.
## 
## 2013-11-07T13:25:07Z
## 2013-08-28T18:18:50Z
## 2014-02-06T16:13:11Z
## 2014-01-04T21:06:44Z
## 
## Description:
## This script attempts to answer the above question.
##  
## Author:
## Min Wang (min.wang@depi.vic.gov.au)
##
## Date Created:
## 17 June 2015
## 
## Date modified and reason: 
##
## Note:
## This script needs to be run in R, Windows desktop because BASC does not allow pops up website 
## authentication.
## 
## Note again:
## The above description "Register an application with the Github API ... base R package 
## and not R studio" are just misleading. It is one way to approach the problem but a simpler way 
## is to just check with Week 1 Video Lectures "Reading JSON" and follow the instructions there.
## 
## Execution: 
## Rscript <MODULE_NAME>
##
## Answer:
## 2013-11-07T13:25:07Z 

## Approach 1
#library(httr)
#library(httpuv)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
#oauth_endpoints("github")

# 2. To make your own application, register at at
#    https://github.com/settings/applications. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.
#myapp <- oauth_app("github",
#  key = "1be483e1d89aa9b5b885",
#  secret = "2555a190a3bd2a2331fa7517162fc5148b702aba")


# 3. Get OAuth credentials
#github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
#gtoken <- config(token = github_token)
#req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
#stop_for_status(req)
#content(req)


## Approach 2
library(jsonlite)
jsonData <- fromJSON("https://api.github.com/users/jtleek/repos")
names(jsonData)
grep("create", names(jsonData))
colnames(jsonData)
jsonData$name
jsonData$created_at[which(jsonData$name=="datasharing")]

