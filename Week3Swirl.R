### Week 3 Swirl on loop functions

## Section #10: lapply and sapply

library(swirl)
ls()
rm(list = ls())
ls()
swirl()
BJKill
1
10

head(flags)
dim(flags)
viewinfo(flags)
class(flags)

# Find the class of each variable (column) for all 194 countries (rows)

cls_list <- lapply(flags, class)   # Returns a list of 30 vectorss of len=1. all character vectors of either "integer" or "character"
cls_list
class(cls_list)
as.character(cls_list)        # Since all 30 list entries are character vectors, we can turn the list into a single character vector

# We can do the same but go straight to the single character vector by using sapply() aka "simplified results of apply()"
cls_vect <- sapply(flags, class)
cls_vect
class(cls_vect)

sum(flags$orange)
flag_colors <- flags[, 11:17]
head(flag_colors)
lapply(flag_colors, sum)
sapply(flag_colors, sum)
sapply(flag_colors, mean)

flag_shapes <- flags[,19:23]
lapply(flag_shapes, range)               # Returns list of min and max number of each shape (column)
shape_mat <- sapply(flag_shapes, range)  # sapply() simplifies list to a 2x5 matrix automatically
shape_mat
class(shape_mat)

unique(c(3, 4, 5, 5, 5, 6, 6))
unique_vals <- lapply(flags, unique)
unique_vals
sapply(unique_vals, length)
sapply(flags, unique)                   # same as lapply(). can't simplify bc each entry in the list is a vector of diff length

lapply(unique_vals, function(elem) elem[2])  # uses anonymous function to extract second item from each element unique_vals
1


## Section 11: vapply and tapply
11

sapply(flags, unique)
# vapply() allows you to specify what output you want it to simplify to, and it'll return an error if it doesn't work.
# vapply() is a "safer" alternative to sapply()
vapply(flags, unique, numeric(1))
# returns 'Error in vapply(flags, unique, numeric(1)) : values must be length 1, but FUN(X[[1]]) result is length 194'
ok()

sapply(flags, class)
vapply(flags, class, character(1))
# returned same as sapply() because the class of each column is a character vecor of length=1.

?tapply
# tapply() to split your data into groups based on the value of some variable, then apply a function to each group
table(flags$landmass) # returns a table of how many countries fall in each landmass
table(flags$animate)  # returns a table of how many countries have flags with (1) and without (0) an animate object.
tapply(flags$animate, flags$landmass, mean) # returns a table of the prop of flags with animate objects on each landmass. nifty.

tapply(flags$population, flags$red, summary)
# Q: What is the median population (in millions) for countries *without* the color red on their flag?
# A: 3.0

tapply(flags$population, flags$landmass, summary)
# Q: What is the maximum population (in millions) for the fourth landmass group (Africa)?
# A: 56.00

























