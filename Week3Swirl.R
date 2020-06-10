### Week 3 Swirl on loop functions

## Section #10: lapply and sapply

library(swirl)
ls()
rm(list = ls())
ls
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
as.character(cls_list)             # Since all 30 list entries are character vectors, we can turn the list into a single character vector

# We can do the same but go straight to the single character vector by using sapply() aka "simplified results of apply()"











































