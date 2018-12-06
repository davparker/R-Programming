## R functions arguments can be matched positionally or by name.
## The following calls to sd are all equivalent

mydata <- rnorm(100)
sd(mydata)
sd(x = mydata)
sd(x = mydata, na.rm = FALSE)
sd(na.rm = FALSE, x = mydata)
sd(na.rm = FALSE, mydata)

# > args(lm)
# function (formula, data, subset, weights, na.action, method = "qr", 
#           model = TRUE, x = FALSE, y = FALSE, qr = TRUE, singular.ok = TRUE, 
#           contrasts = NULL, offset, ...) 
#   NULL


##following are equivalent
lm(data = mydata, y ~ x, model = FALSE, 1:100)
lm(y ~ x, mydata, 1:100, model = FALSE)
