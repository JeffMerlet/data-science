## As matrix inversion is a costly computation, one solution to avoid such 
## computation is to cache such computation.
## The solution here is to create a 'special' matrix object that can cache its
## inverse, after the first calculation. If the matrix is updated then the 
## cached inverse matrix is nullified (as not anymore valid).
##
## Typical usage with a random matrix
## set.seed(320569)
## r <- rnorm(490000)
## m <- matrix(r, 700, 700)
## sm <- makeCacheMatrix(m)
## ism <- cacheSolve(sm)
## At this point, any subsequent call to cacheSolve(sm) will return 
## the cached matrix inverse.

## Creates a matrix object that can cache in memory its inverse. The returned
## object is a list with the following functions (in that order):
## set(): set the matirx
## get(): get the matirx
## setinv(): set the inverse matrix
## getinv(): get the inverse matrix; the cahced inverse is returned if already
##           calculated/cached and the matrix has not been updated since the
makeCacheMatrix <- function(x = matrix()) {
    # Inits the matrix inverse to null
    inv <- NULL
    
    # Defines the set() function by setting x and nullifying inv
    set <- function(y) {
        x <<- y
        inv <<- NULL 
    }
    
    # Defines the get() function that returns x
    get <- function() {
        x
    }
    
    # Defines the setinv() function that cache the supplied matrix inverse
    # in inv
    setinv <- function(inverse) {
        inv <<- inverse
    }
    
    # Defines the getinv() function that return the cached matrix inverse
    getinv <- function() {
        inv
    }
    
    # Returns the matrix list with the 4 functions
    list(set = set,
         get = get,
         setinv = setinv,
         getinv = getinv
    )

}


## Returns the inverse of any matrix created with makeCacheMatrix and
## supplied as x. 
## If the inverse of an unchanged matrix has already been calculated, 
## then the already calculated and cached inverse of the matrix is being
## retrieved and returned
cacheSolve <- function(x, ...) {
    # Gets the cached matrix inverse
    inv <- x$getinv()
    
    # If the cached matrix inverse is null, then calculates the matrix inverse
    # and sets the inverse into the matrix object
    if ( is.null(inv) ) {
        # Computes the matrix inverse
        inv <- solve(x$get(), ...)
        
        # Caches the calculated matrix inverse
        x$setinv(inv)
    }

    # Returns the matrix inverse
    inv
}
