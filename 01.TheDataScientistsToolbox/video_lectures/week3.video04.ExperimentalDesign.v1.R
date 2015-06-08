## Experimental Design

## The lecture slides hints that: 
## Identifying genomic signatures is part of the job in 
## personalized medicine within cancer therapeutics.
## But it's hard and low accuracy because of bad experimental 
## design.

## Have a plan for data and code sharing
## GitHub: Good for storing small amount of data
## Figshare: Good for storing larger amount of data, http://figshare.com
## The Leek group (one of the lecturer of this course) has developed a guide 
## to data sharing, which can be downloaded via GitHub

## Confounders
## Correlation is not causation *****
## The speaker draws very good examples to explain the subject and highlight 
## the importance of considering potential other variables that may cause the
## observed correlation.

## Deal with confounders: Randomization and blocking
## - fix a variable 
## - stratify, R package 'stratification'
## - randomize, i.e. bootstraping 

## Prediction vs Inference
## Inference prefers to have more similar distributions (u, sd)
## Prediction prefers more seperated distributions (u, sd) to distinguish one 
## from another

## Prediction key quantities
## Sensitivity                ->  Pr(positive test | disease)
## Specificity                ->  Pr(negative test | no disease)
## Positive Predictive Value  ->  Pr(disease | positive test)
## Negative Predictive Value  ->  Pr(disease | negative test)
## Accuracy                   ->  Pr(correct outcome)

## Beware data dredging (疏浚) 

## Summary
## Good experiments 
## - Have replication
## - Measure variability
## - Generalize to the problem you care about
## - Are transparent
## Prediction is not inference
## - Both can be important
## Beware data dredging
 
