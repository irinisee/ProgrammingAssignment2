## The function, makeCacheMatrix creates a matrix, which contains a function to
## set the value of the matrix
## get the value of the matrix
## inverse the matrix
## get the inversion

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


## calculates the mean of the matrix created with the above function. 
## first checks to see if the inverse has already been calculated. 
## If so, it gets the inversion from the cache and skips the computation. 
## Otherwise, it does the inversion of the data and sets the invrsion value in the cache via the setinversion function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    m <- x$getinverse()
    if(!is.null(m)) {
      message("getting cached data")
      return(m)
  }
    data <- x$get()
    m <- sovle(data, ...)
    x$setinverse(m)
    m
}
