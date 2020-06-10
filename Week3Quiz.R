### Week 3 Quiz

library(datasets)
data(iris)
?iris

# Q1: There will be an object called 'iris' in your workspace. In this dataset, what is the mean of 'Sepal.Length'
# for the species virginica? Please round your answer to the nearest whole number.

tapply(iris$Sepal.Length, iris$Species, summary)
# A1: 6.588 rounds to 7.

# Q2: Continuing with the 'iris' dataset from the previous Question, what R code returns a vector of the 
# means of the variables 'Sepal.Length', 'Sepal.Width', 'Petal.Length', and 'Petal.Width'?
apply(iris[, 1:4], 2, mean)
# A2: apply(iris[, 1:4], 2, mean)

?apply

data(mtcars)
?mtcars

# Q3: How can one calculate the average miles per gallon (mpg) by number of cylinders in the car (cyl)? 
# Select all that apply.

apply(mtcars, 2, mean) # no. avg of every col, not sorted by cyl.
sapply(mtcars, cyl, mean) # no. args error.
sapply(split(mtcars$mpg, mtcars$cyl), mean) # YES
split(mtcars, mtcars$cyl) # not quite...just gives us a split list. could manually do it after this tho.
mean(mtcars$mpg, mtcars$cyl) # no. args error.
tapply(mtcars$mpg, mtcars$cyl, mean) # YES
lapply(mtcars, mean) # no. list version of first option
with(mtcars, tapply(mpg, cyl, mean)) # YES
tapply(mtcars$cyl, mtcars$mpg, mean) # no

# Q4: Continuing with the 'mtcars' dataset from the previous Question, what is the absolute difference between
# the average horsepower of 4-cylinder cars and the average horsepower of 8-cylinder cars?

hpbycyl <- tapply(mtcars$mpg, mtcars$cyl, mean)  ## DID THIS WRONG. WANTED HP NOT MPG, IDIOT.
class(hpbycyl)
as.matrix(hpbycyl)
hpbycyl[1] - hpbycyl[3]             # returns 11.56364
hpbycyl_vect <- as.vector(hpbycyl)
hpbycyl_vect[1] - hpbycyl_vect[3]   # returns 11.56364

## ABOVE DONE CORRECTLY:
hpbycyl2 <- tapply(mtcars$hp, mtcars$cyl, mean)
hpbycyl2
hpbycyl2[3] - hpbycyl2[1]
# A4: 126.5779 rounds to 127. dillweed.

# Q5: what happens when you do this?
#debug(ls)
#ls()

