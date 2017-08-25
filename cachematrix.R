## To demonstrate the using of different environments and the <<- operator
## below functions will create a special matrix and caches its inverse


## The first function creates a "special" matrix which
## is really a list of get/set the matrix
## and get/set the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setInverse <- function(i) inv <<- i
        getInverse <- function() inv
        list(set = set, get = get,
             setInverse = setInverse,
             getInverse = getInverse)
}

## The second function calculates the inverse of the special vector
## created by the function above.
## It checks if the inverse has already been calculated and returns the
## cached inverse if present, otherwhise is calulcates
## the inverse and adds it to the cache using the setInverse function

cacheSolve <-function(m,...){
	inv <- m$getInverse()
	if(!is.null(inv)){
		message("getting cached data")
		return(inv)
	}
	data <- m$get()
	inv <- solve(data)
	m$setInverse(inv)
	inv
}
