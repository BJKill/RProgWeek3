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


















