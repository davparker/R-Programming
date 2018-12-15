## create required function for Programming Assignment 3
## David Parker 2018-12-14
## Function corr, class assignment 
##
## load prev assignment's functions
setwd("~/GitHub/jhu-data-science/R-Programming")
source("complete.R")
source("pollutantmean.R")
##
## seperate function for building airquality data.frame that meets threshold
airquality <- function(directory = "specdata", id = length(dir(directory,pattern = "*.csv"))) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    csvfiles <- dir(directory, full.names = TRUE)
    ## init data frames
    df.airquality <- data.frame()
    df.readcsv <- data.frame()
    df.complete <- data.frame()
    for(i in id) {
        df.readcsv <- read.csv(csvfiles[i])
        df.complete <- df.readcsv[complete.cases(df.readcsv), ]
        df.airquality <- rbind(df.airquality, df.complete)
    }
    ## Return the airquality data frame
    df.airquality
}
##
## 'threshold' is a numeric vector of length 1 indicating the
## number of completely observed observations (on all
## variables) required to compute the correlation between
## nitrate and sulfate; the default is 0
## process one monitoring station at a time to compare against threshold
## 'directory' is a character vector of length 1 indicating
## the location of the CSV files
##
corr <- function(directory = "specdata", threshold = 0) {
    csvfiles <- dir(directory, full.names = TRUE)
    df.cor <- data.frame()
    df.nobs <- data.frame()
    df.cln <- data.frame()
    cr <- vector("numeric")
    ## retrieve all monitoring stations ids and nobs (clean data rows)
    ## call complete(function) in previous assignment
    df.nobs <- complete(directory, 1:length(csvfiles))
    ## limit df.nobs to those stations that meet the threshold 
    df.nobs <- df.nobs[df.nobs$nobs > threshold, ]
    ## now build the vector 'cr' containing values for stations meeting threshold
    for (i in df.nobs[ ,"id"]) {
        ##df.cln is data.frame for all monitoring stations meeting threshold
        df.cln <- rbind(df.cln, airquality(directory, i))
        ## corval contains correlation for sulfate & nitrate for each station
        corval <- cor(df.cln[df.cln$ID==i,"sulfate"],df.cln[df.cln$ID==i ,"nitrate"])
        ## df.cor contains the correlation for each station
        df.cor <- rbind(df.cor, corval)
    }
    ## Return a numeric vector of correlations
    cr <- (df.cor[complete.cases(df.cor), ])
    cr
}
