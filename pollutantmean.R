## create required function for Programming Assignment 1
## David Parker 2018-12-14
## Function pollutantmean
#
setwd("~/GitHub/jhu-data-science/R-Programming")
# Write a function named 'pollutantmean' that calculates the mean of a pollutant
# (sulfate or nitrate) across a specified list of monitors. The function
# 'pollutantmean' takes three arguments: 'directory', 'pollutant', and 'id'.
# Given a vector monitor ID numbers, 'pollutantmean' reads that monitors'
# particulate matter data from the directory specified in the 'directory'
# argument and returns the mean of the pollutant across all of the monitors,
# ignoring any missing values coded as NA. A prototype of the function is as
# follows:
# preliminary steps, get the data!
#
# fileUrl <- "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip"
# download.file(fileUrl,"./specdata.zip")
# unzip("./specdata.zip")
#
pollutantmean <- function(directory = "specdata", pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    csvfiles <- dir(directory,full.names=TRUE)
    df.pollutant <- data.frame()
    for(i in id){
        df.pollutant <- rbind(df.pollutant,read.csv(csvfiles[i]))
    }
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    mean(df.pollutant[,c(pollutant)],na.rm=TRUE)
}
