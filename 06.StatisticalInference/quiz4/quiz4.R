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
## 12 August 2015
## 
## Date modified and reason: 
##
## Execution: 
## Rscript <MODULE_NAME>


## Question 1
## A pharmaceutical company is interested in testing a potential blood pressure 
## lowering medication. Their first examination considers only subjects that 
## received the medication at baseline then two weeks later. The data are in
## quiz4.ques1.csv. Note: Consider testing the hypothesis that there was a mean 
## reduction in blood pressure? Give the P-value for the associated two sided T 
## test. (Hint, consider that the observations are paired.)
data <- read.csv("quiz4.ques1.csv")
t.test(data[, 2], data[, 3], paired=TRUE, alternative="two.sided")


## Question 2
## A sample of 9 men yielded a sample average brain volume of 1,100cc and a 
## standard deviation of 30cc. What is the complete set of values of that a test 
## of would fail to reject the null hypothesis in a two sided 5% Students t-test?
CI <- 1100 + c(-1, 1) * qt(1-0.05/2, 9-1) * (30/sqrt(9))
round(CI, 0)


## Question 3
## Researchers conducted a blind taste test of Coke versus Pepsi. Each of four 
## people was asked which of two blinded drinks given in random order that they 
## preferred. The data was such that 3 of the 4 people chose Coke. Assuming that 
## this sample is representative, report a P-value for a test of the hypothesis 
## that Coke is preferred to Pepsi using a one sided exact test.
pbinom(2, 4, 0.5, lower.tail=FALSE)


## Question 4
## Infection rates at a hospital above 1 infection per 100 person days at risk 
## are believed to be too high and are used as a benchmark. A hospital that had 
## previously been above the benchmark recently had 10 infections over the last 
## 1,787 person days at risk. About what is the one sided P-value for the 
## relevant test of whether the hospital is *below* the standard?
ppois(10, 1/100*1787)


## Question 5
## Suppose that 18 obese subjects were randomized, 9 each, to a new diet pill 
## and a placebo. Subjects’ body mass indices (BMIs) were measured at a baseline 
## and again after having received the treatment or placebo for four weeks. The 
## average difference from follow-up to the baseline (followup - baseline) was 
## −3 kg/m2 for the treated group and 1 kg/m2 for the placebo group. The 
## corresponding standard deviations of the differences was 1.5 kg/m2 for the 
## treatment group and 1.8 kg/m2 for the placebo group. Does the change in BMI 
## appear to differ between the treated and placebo groups? Assuming normality 
## of the underlying data and a common population variance, give a pvalue for a 
## two sided t test.
baseline_n <- 9
treatment_n <- 9
baseline_mean <- 1
treatment_mean <- -3 
baseline_sd <- 1.8
treatment_sd <- 1.5
alpha <- 
Sp <- function(nx, ny, Sx2, Sy2) {
    sp2 <- ((nx - 1) * Sx2 + (ny - 1) * Sy2)/(nx + ny - 2)
    return(sqrt(sp2))
}

sp <- Sp(baseline_n, treatment_n, baseline_sd^2, treatment_sd^2)

ts <- (treatment_mean - baseline_mean)/(sp * sqrt(1/baseline_n + 1/treatment_n))

2 * pt(ts, baseline_n + treatment_n - 2)


## Question 6
## Brain volumes for 9 men yielded a 90% confidence interval of 1,077 cc to 
## 1,123 cc. Would you reject in a two sided 5% hypothesis test of H0: u=1,078?
print("No, you would fail to reject. The 95% interval would be wider than the 90% interval. Since 1,078 is in the narrower 90% interval, it would also be in the wider 95% interval. Thus, in either case it's in the interval and so you would fail to reject.")


## Question 7
## Researchers would like to conduct a study of healthy adults to detect a four 
## year mean brain volume loss of . Assume that the standard deviation of four 
## year volume loss in this population is . About what would be the power of 
## the study for a one sided test versus a null hypothesis of no volume loss?
power.t.test(n=100, delta=0.01, sd=0.04, sig.level = 0.05, type="one.sample", alternative="one.sided")


## Question 8
## Researchers would like to conduct a study of healthy adults to detect a four 
## year mean brain volume loss of .01 mm^3. Assume that the standard deviation 
## of four year volume loss in this population is .04 mm^3. About what would be 
## the value of needded for power of type one error rate of one sided test 
## versus a null hypothesis of no volume loss?
power.t.test(delta=0.01, sd=0.04, sig.level = 0.05, power=0.9, type="one.sample", alternative="one.sided")


## Question 9
## As you increase the type one error rate, alpha, what happens to power?
print("It's impossible to tell given the information in the problem.")


