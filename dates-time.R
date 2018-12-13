

# So dates are represented by the date class. and, times are represented by two
# separate classes: the POSIXct and the POSIXlt class.
# Dates are stored internally the as the number of days since 1970 January 1st.
# Times are stored internally as the number of seconds. Since 1970, January 1st.

d1 <- as.Date("1970-01-01")
d1

typeof(d1)
# [1] "double"
class(d1)
# [1] "Date"

unclass(d1)  # get internal days since Jan 01 1970
# [1] 0   # no days passed
unclass(as.Date("1970-01-02"))  # get internal days since Jan 01 1970
# [1] 1   # 1 day passed

# POSIXct class. Times are represented at just as very large integers. 

# POSIXlt# stores a time as a list. underlying, and so, and it stores a bunch of
# other useful information about a given time, for example what's the day of the
# week of that time, what's the the day of the year, the day of the month, or
# the month itself.

t1 <- Sys.time()
t1
# [1] "2018-12-10 03:18:53 CST"

unclass(t1)
# [1] 1544433533  # secs passed since Jan 01 1970

names(unclass(t1))
# NULL

t1$sec
# Error in t1$sec : $ operator is invalid for atomic vectors (posixct has no list elements)

t2 <- as.POSIXlt(t1)
t2
# [1] "2018-12-10 03:18:53 CST"

names(unclass(t2))
# [1] "sec"    "min"    "hour"   "mday"   "mon"    "year"   "wday"   "yday"   "isdst"  "zone"  
# [11] "gmtoff"

t2$sec
# [1] 53.45917  (posixlt contains list elements for time components)

## Convert time formats
datestring <- c("January 10, 2012 10:40", "December 9, 2011 9:10")
# datestring <- c("January 10, 2012 10:40", "December 9, 2011 9:10", "September 05, 1962 15:34")
datestring
# [1] "January 10, 2012 10:40" "December 9, 2011 9:10"

x <- strptime(datestring, "%B %d, %Y %H:%M")
x
# [1] "2012-01-10 10:40:00 CST" "2011-12-09 09:10:00 CST"

class(x)
# [1] "POSIXlt" "POSIXt"

## Operations on Date and Time
x <- as.Date("2012-01-01")
y <- strptime("9 Jan 2011 11:34:21", "%d %b %Y %H:%M:%S")
x-y
# Error in x - y : non-numeric argument to binary operator
# In addition: Warning message:
# Incompatible methods ("-.Date", "-.POSIXt") for "-" 

class(x)
# [1] "Date"
class(y)
# [1] "POSIXlt" "POSIXt" 

x <- as.POSIXlt(x)
x-y
# Time difference of 356.2678 days

# Keeps track of leap years, seconds, and timezones
x <- as.Date("2012-03-01"); y <- as.Date("2012-02-28")
x-y
# Time difference of 2 days

x <- as.POSIXct("2012-10-25 01:00:00")
y <- as.POSIXct("2012-10-25 06:00:00", tz = "GMT")
y-x
# Time difference of 0 secs
