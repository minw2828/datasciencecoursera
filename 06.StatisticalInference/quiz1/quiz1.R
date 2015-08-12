# /usr/bin/rscript

## Coursera Statistical Inference
## by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD
## Johns Hopkins University
##
## Description:
## This script attempts to answer Quiz 4 Questions.
##  
## Author:
## Min Wang (min.wang@depi.vic.gov.au)
##
## Date Created:
## 10 August 2015
## 
## Date modified and reason: 
##
## Execution: 
## Rscript <MODULE_NAME>


## Question 1
## Consider influenza epidemics for two parent heterosexual families. Suppose 
## that the probability is 17% that at least one of the parents has contracted 
## the disease. The probability that the father has contracted influenza is 12% 
## while the probability that both the mother and father have contracted the 
## disease is 6%. What is the probability that the mother has contracted 
## influenza?
x <- 0.17 - 0.12 + 0.06


## Question 2
## A random variable, is uniform, a box from 0 to 1 of height 1. (So that its 
## density is for .) What is its 75th percentile? (Hints, look at lecture 2 
## around 21:30 and homework 1 page 4/10. Also, look up the help function for 
## the qunif command in R.)
qunif(0.75)


## Question 3
## You are playing a game with a friend where you flip a coin and if it comes 
## up heads you give her X dollars and if it comes up tails she gives you Y 
## dollars. The probability that the coin is heads is p (some number between 0 
## and 1.) What has to be true about and to make so that both of your expected 
## total earnings is 0. The game would then be called “fair”. 
p * X = (1-p) * Y


## Question 4
## A density that looks like a normal density (but may or may not be exactly 
## normal) is exactly symmetric about zero. (Symmetric means if you flip it 
## around zero it looks the same.) What is its median? 
print("The median must be 0.")


## Question 5
## Consider the following PMF shown below in R
## x <- 1:4
## p <- x/sum(x)
## temp <- rbind(x, p)
## rownames(temp) <- c("X", "Prob")
## temp
## What is the mean? 
x <- 1:4
p <- x/sum(x)
temp <- rbind(x, p)
rownames(temp) <- c("X", "Prob")
temp
for (i in seq(1, ncol(temp))) {
    result <<- result + temp[1, i] * temp[2, i]
}
result


## Question 6
## A web site (www.medicine.ox.ac.uk/bandolier/band64/b64-7.html) for home 
## pregnancy tests cites the following: “When the subjects using the test 
## were women who collected and tested their own samples, the overall 
## sensitivity was 75%. Specificity was also low, in the range 52% to 75%.” 
## Assume the lower value for the specificity. Suppose a subject has a positive 
## test and that 30% of women taking pregnancy tests are actually pregnant. 
## What number is closest to the probability of pregnancy given the positive 
## test?
sensitivity <- actual_positive/test_positive <- 0.75
specificity <- actual_negative/test_negative <- (1 - actual_positive)/(1 - test_positive) <- 0.52
actual_positive <- 0.3
true_positive <- test_positive/actual_positive


