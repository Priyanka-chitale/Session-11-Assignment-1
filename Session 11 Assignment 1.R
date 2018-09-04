getwd()
setwd("D:/Priyanka/R")

library("readr")
bank = read.csv("bank.csv", header = TRUE, na.strings = TRUE, sep = ";")

## a. Create a visual for representing missing values in the dataset.
colSums(is.na.data.frame(bank))
is.na(bank)
is.null(bank)
str(bank)
library(mice)
md.pattern(bank)

library(VIM)
mice_plot <-aggr(bank,col=c('blue','yellow'), numbers=T, sortVars=T, labels=names(bank), cex.axis=.7,gap=3,ylab=c("Missing Data",
                                                                                                              "Pattern"))
## b. Show a distribution of clients based on a Job.

job = table(bank$job)
barplot(job, main="Distribution on clients", 
        xlab="Clients", ylab = "Count")

## c. Check whether is there any relation between Job and Marital Status?

marital = table(bank$marital)

t.test(job,marital)

## d. Check whether is there any association between Job and Education?

education = table(bank$education)

t.test(job,education)