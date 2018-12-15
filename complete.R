## create required function for Programming Assignment 2
## David Parker 2018-12-14
## Function complete
##
setwd("~/GitHub/jhu-data-science/R-Programming")
##
## Write a function that reads a directory full of files and reports the number
## of completely observed cases in each data file. The function should return a
## data frame where the first column is the name of the file and the second
## column is the number of complete cases. A prototype of this function follows
##
complete <- function(directory = "specdata", id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    csvfiles <- dir(directory, full.names = TRUE)
    ## define workset data.frames df.pollutant, df.complete, df.nobs
    df.pollutant <- data.frame()
    df.complete <- data.frame()
    df.nobs <- data.frame()  
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    for(i in id) {
        ## reinitialze df.pollutant and df.complete on each iteration
        ## to get new complete cases. i.e. don't row bind
        df.pollutant <- read.csv(csvfiles[i])
        df.complete <- df.pollutant[complete.cases(df.pollutant), ]
        ## keep appending new complete cases to existing data.frame with row bind
        df.nobs <- rbind(df.nobs, c(i, nrow(df.complete)))
    }
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    ## add column names 
    names(df.nobs) <- c("id", "nobs")
    df.nobs
}
##
## example output Programming Assignment 2
## source("complete.R")
## complete("specdata", 1)
##   id nobs
## 1  1  117
## complete("specdata", c(2, 4, 8, 10, 12))
##   id nobs
## 1  2 1041
## 2  4  474
## 3  8  192
## 4 10  148
## 5 12   96
## complete("specdata", 30:25)
##   id nobs
## 1 30  932
## 2 29  711
## 3 28  475
## 4 27  338
## 5 26  586
## 6 25  463
## complete("specdata", 3)
##   id nobs
## 1  3  243