## These two functions are going to help make computing matrix inverses easier by storing or 'cacheing' inverses that we
## compute so that if we need to compute them later, we can fetch them out of the cache instead of computing them again.
## Remember: very large matricies require a lot of time to compute their inverses, so this can be really useful!!

## This first function creates a special "Matrix" that is really just a list of 4 functions that 
## 1. Set the value of the matrix
## 2. Get the value of the matrix
## 3. Set the value of the matrix inverse
## 4. Get the value of the matrix inverse

makeCacheMatrix <- function(x1 = matrix()) {
        m1 <- NULL
        setmat <- function(y1) {
                x1 <<- y1
                m1 <<- NULL
        }
        getmat <- function() x1
        setsolve <- function(solve) m1 <<- solve
        getsolve <- function() m1
        list(setmat = setmat, getmat = getmat, setsolve = setsolve, getsolve = getsolve)
}


## This next function first looks to see if the matrix inverse has already been computed and cached. If so, it returns the
## cached matrix inverse. Otherwise, it calculates the inverse of the matrix, puts it in the cache, and returns it.

cacheSolve <- function(x1, ...) {
        ## Return a matrix that is the inverse of 'x'
        m1 <- x1$getsolve()
        if(!is.null(m1)) {
                message("getting cached data")
                return(m1)
        }
        data1 <- x1$getmat()
        m1 <- solve(data1, ...)
        x1$setsolve(m1)
        m1
}
