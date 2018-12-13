

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

unclass(d1)
# [1] 0   # no days passed
unclass(as.Date("1970-01-02"))
# [1] 1   # 1 day passed

