## The function, makeCacheMatrix creates a matrix, which contains a function to set the value of the matrix
makeCacheMatrix <- function(x = matrix()) {
  
    #set m to be NULL essentially resetting the process
    m <- NULL
    
    #withing the function, it takes the input (matrix) and assigns it to x in the parent environment of the function
    set <- function(y) {
        x <<- y
        m <<- NULL
  }
  
    #returns the raw matrix
    get <- function() x
  
    #assign an argument to m. Available outside the function. The function takes an argument which is the inversion
    setinv <- function(solve) m <<- solve
  
    #Returns the value for m 
    getinv <- function() m
  
    #outputs the list of functions defined above naming each entry in the list by the
    #function names
    list(set = set, get = get,
        setinv = setinv,
        getinv = getinv)
}



# calculate the inversion of the matrix created with the above function. 
cacheSolve <- function(x, ...) {
    
    # Return a matrix that is the inverse of 'x'
    m <- x$getinv()
    
    # first checks to see if the inverse has already been calculated
    # If so, it gets the inversion from the cache and skips the computation.
    if(!is.null(m)) {
      message("getting cached data")      
      return(m)
  }
  
    # otherwise, calculate the inverse and cache it
    data <- x$get()
    m <- sovle(data, ...)
    x$setinv(m)
    m
}
