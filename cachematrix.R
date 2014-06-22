## Two functions to invert a matrix, cache the results, and retrieve the cached value if it exists.

## First function: a function to set and get the values of a matrix and its inverse, and to cache the result

makeCacheMatrix <- function(x = matrix()) {
	m <- NULL
	set <- function(y) {
		x <<- y
		m <<- NULL
	}
	get <- function() x
	setinverse <- function(solve) m <<- solve
	getinverse <- function() m
	list(set = set, get = get,
	     setinverse = setinverse,
             getinverse = getinverse)
}


## Second function: calculate the inverse of a matrix. Function will first checked for a cached value; if it exists, the function will use it.
#    If a cached value does not exist, function will calculate the inverse and cache it.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	m <- x$getinverse()
	if(!is.null(m)) {
		message("getting cached data")
		return(m)
	}
	data <- x$get()
	m <- solve(data, ...)
	x$setinverse(m)
	m
}
