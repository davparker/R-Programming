##first function
add2 <- function(x, y) {
    x + y
}

add2(3, 5)

above10 <- function(x) {
    use <- x > 10
    x[use]
}

above <- function(x, n = 10) {
    use <- x > n
    x[use]
}

x <- 1:20
above(x, 12)

## returns mean of each column in a data frame
columnmean <- function(y, removeNA = TRUE) {
    nc <- ncol(y)
    means <- numeric(nc)
    for(i in 1:nc) {
        means[i] <- mean(y[ ,i], na.rm = removeNA)
    }
    means
}

