## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
##the function makeCacheMatrix creates a special matrix object that can cache its inverse. 
##This function sets up four methods that can be used on the matrix object that is created: set, get, setInverse, and getInverse. 

makeCacheMatrix <- function(x = matrix()) {
inv <- NULL
set <- function(y) {
x <<- y
inv <<- NULL
}
get <- function() x
setInverse <- function(inverse) inv <<- inverse
getInverse <- function() inv
list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## Write a short comment describing this function
##cacheSolve, computes the inverse of the matrix object created by makeCacheMatrix above.
##The function first checks to see if the inverse has been cached, and if it has, it retrieves the cached data. 
##If the inverse has not been cached, it calculates the inverse using the solve function, caches the inverse using setInverse, and returns the inverse.

cacheSolve <- function(x, ...) {
inv <- x$getInverse()
if(!is.null(inv)) {
message("getting cached data")
return(inv)
}
data <- x$get()
inv <- solve(data, ...)
x$setInverse(inv)
inv        ## Return a matrix that is the inverse of 'x'
}
