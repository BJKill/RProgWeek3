## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

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


## Write a short comment describing this function

cacheSolve <- function(x1, ...) {
        ## Return a matrix that is the inverse of 'x'
        m1 <- x1$getsolve()
        if(!is.null(m1)) {
                message("getting cached data")
                return(m1)
        }
        data <- x1$getmat()
        m1 <- solve(data, ...)
        x1$setmean(m1)
        m1
}
