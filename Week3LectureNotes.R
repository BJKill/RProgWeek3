## Notes from Week 3 Lecutre
## 
# lapply - loop over a list
# sapply - simplifies lapply
# apply - apply a function over the margins of an array
# tapply - apply function over subsets of a vector
# mapply - multivariate version of lapply
# splip - splits list


## lapply - always returns a list
lapply

x<- list(a = 1:5, b = rnorm(10))
lapply(x, mean)

x <- list(a=1:4, b=rnorm(10), c=rnorm(20,1), d=rnorm(100,5))
lapply(x,mean)

x <- 1:4
lapply(x, runif)   #runif creates random unifor of length = input to runif (so prints 1, 2, 3, 4 rand#s)

lapply(x, runif, min=0, max=10) #rand unif #s b/w 0 and 10

x <- list(a = matrix(1:4,2,2), b = matrix(1:6,2,3))
x
lapply(x, function(elt) elt[,1])  ## anonymous function that extracts first column

## sapply - tries to simplify lapply if possible. list -> vector, often. maybe matrix if list vects same length
x <- list(a=1:4, b=rnorm(10), c=rnorm(20,1), d=rnorm(100,5))  #list of 4 vectors of diff length
lapply(x, mean) # returns list length=4 of vectors length=1 that contain mean of vectors of x
sapply(x, mean) # returns a vector of length=4 containing means...probably more desireable
mean(x)         # returns an error bc mean can't be done on a list, only vector.


## apply - used to evaluate a functions over the margins of an array.  most often rows or cols of matrix

str(apply)
# function (X, MARGIN, FUN, ...)

x <- matrix(rnorm(200), 20, 10)
apply(x, 2, mean)   # margin=2 applies mean over dimension #2 of matrix - so columns. Vector of len=10
apply(x, 1, sum)    # margin=1 applies sum over dimension #1 of matrix - so rows. Vector of len=20

# shorcuts for col/row sums and means -- MUCH FASTER
# rowSums = apply(x, 1, sum)
# rowMeans = apply(x, 1, mean)
# colSums = apply(x, 2, sum)
# colMeans = apply(x, 2, mean)
                        
colMeans(x)
rowSums(x)

x <- matrix(rnorm(200), 20, 10)
apply(x, 1, quantile, probs = c(0.25, 0.75))
##returns 2x20 matrix of 25th and 75th percentiles of each of the 20 rows of numbers

a <- array(rnorm(2 * 2 * 10), c(2, 2, 10)) ## 3D matrix...2x2x10...effectively 2x2's stacked 10 high
apply(a, c(1,2), mean)                     ## finds mean of each stack of 10 in each position. kept dim1,dim2   
rowMeans(a, dims = 2)                      ## does same thing as above

## mapply - multivariate version. applies function in parallel over a set of arguments
str(mapply)  
# function (FUN, ..., MoreArgs = NULL, SIMPLIFY = TRUE, USE.NAMES = TRUE) 

x <- list(rep(1, 4), rep(2, 3), rep(3, 2), rep(4, 1))
x
# instead:
mapply(rep, 1:4, 4:1)  # rep(value, frequency) has 2 args, so after rep, need the 2 args.
                       # value goes from 1 to 4, but frequency goes down from 4 to 1.

noise <- function(n, mean, sd) {
        rnorm(n, mean, sd)
}

noise(5,1,2)                # gives us 5 random normal numbers w/ mean=1 sd=2
noise(1:5, 1:5, 2)          # gives us 5 random normal numbers. want: 1 rnorm w/mean=1, 2 rnorms w/mean=2, etc.
list(noise(1,1,2), noise(2,2,2), noise(3,3,2), noise(4,4,2), noise(5,5,2)) # hard way to get what we want
mapply(noise, 1:5, 1:5, 2)  # easy way to get what we want!!

## tapply - apply a function to a subset of a vector
str(tapply)
# function (X, INDEX, FUN = NULL, ..., default = NA, simplify = TRUE)
# X is a vector. INDEX is a factor or a list of factors (men/women, etc)

x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)     #generate 3 levels of size=10. roundabout way of 'naming' parts of vectors.
                   #creates vector of 10 1's, 10 2's, 10 3's
f
tapply(x, f, mean)                      #finds mean of 3 groups as a vector len=3
tapply(x, f, mean, simplify = FALSE)    #finds mean of 3 groups as a list of len=3 of vectors len=1

tapply(x, f, range)                     #finds range of 3 groups as a list of len=3 of vectors len=2

## split
str(split)
# function (x, f, drop = FALSE, ...)
# x = vector, list, or dataframe.  f = factor or list of factors

x <- c(rnorm(10), runif(10), rnorm(10,1))
f <- gl(3, 10)
split(x, f)     #always returns a list. this split our vector of 30 by factors into list len=3 of vect len=10

lapply(split(x,f), mean)  #common to use lapply after a split...similar to tapply in that regard

library(datasets)
head(airquality)
s <- split(airquality, airquality$Month)
lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")])) # returns list - nice
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")])) # returns matrix - nicer
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm = TRUE)) # returns matrix w/o NAs - nicest

## splitting on more than one level
x <- rnorm(10)
f1 <- gl(2, 5)       # returns '1 1 1 1 1 2 2 2 2 2'
f2 <- gl(5, 2)       # returns '1 1 2 2 3 3 4 4 5 5'
f1
f2
interaction(f1, f2)  # combines all levels of first paired with all levels of second
                     # returns '1.1 1.1 1.2 1.2 1.3 2.3 2.4 2.4 2.5 2.5'

str(split(x, list(f1, f2)))              # automatically calls interaction function on factor list
str(split(x, list(f1, f2), drop = TRUE)) # drops empty level bc not all levels have observations in them



## DEBUGGING
# indications that something's not right:
# message - generic notification. doesn't inturrupt execution.
# warning - an indication that something is wrong but not necessarily fatal. execution continues but warning at end.
# error - an indcication that a fatal problem has occurred; execution stops, producted by 'stop' function.
# condition - a generic concept for indicating that something unexpected can occur. programmers create their own.

log(-1)
# retuns 'Warning message: In log(-1): NaNs produced'

printmessage <- function(x) {
        if(x > 0) {
                print("x is greater than zero")
        }
        else {
                print("x is less than or equal to zero")
        }
        invisible(x) ##prevents auto-printing when function returns object
}
##ALL PRINT FUNCTIONS RETURN THE VALUE IT PRINTS
printmessage(1)
printmessage(-2)
printmessage(NA)  #returns error. NA isn't bigger or smaller than 0.


printmessage2 <- function(x) {
        if(is.na(x))
                print("x is a missing value!")
        else if(x > 0)
                print("x is greater than zero")
        else
                print("x is less than or equal to zero")
        invisible(x)
}

x <- log(-1)
printmessage2(x)

## How do you know something is wrong with your function?

# What was your input? How did you call the function?
# What were you expecting? Output, message, other results?
# What did you get?
# How does what you get differ from what you were expecting?
# Were your expectations correct in the first place?
# Can you reproduce the problem (exactly)?

## Debuggin tools in R:

# traceback - prints out the function call stack after an error occurs; does nothing if no error
# debug - flags a function for 'debug' mode which allows you to step thru execution one line at a time anytime, anywhere.
# browser - suspends the execution of a function wherever it is called and puts the function in debug mode. stick it anywhere in code
# trace - allows you to insert debugging code into a function at specific places w/o permanantly changing code (good for debugging other's code)
# recover - allows you to modify the error behavior so that you can brows the function call stack

rm(x)

mean(x)
# returns "Error in mean(x) : object 'x' not found"

traceback() #use **immediately** after getting an error

lm(y ~ x)
# "Error in eval(predvars, data, env) : object 'y' not found"
traceback()
#7: eval(predvars, data, env)
#6: eval(predvars, data, env)
#5: model.frame.default(formula = y ~ x, drop.unused.levels = TRUE)
#4: stats::model.frame(formula = y ~ x, drop.unused.levels = TRUE)
#3: eval(mf, parent.frame())
#2: eval(mf, parent.frame())
#1: lm(y ~ x)

debug(lm)
lm(y ~ x)

options(error = recover)
read.csv("nosuchfile")
# don't get console back after error. get an error followed by a menu of function callstack (similar to traceback)

### Summary
# Three main indicators of problem: message, warning, error. Only error is fatal
# When anayzing a function w/ a prob, make sure you can reproduce the problem, clearly state your expectations and how output differs
# Interactive debugging: traceback, debug, broswer, trace, recover
# DEBUGGING TOOLS ARE NOT A SUBSTITUTE FOR THINKING!!!





