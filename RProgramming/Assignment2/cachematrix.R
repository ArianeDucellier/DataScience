##    These two functions allow the user to cache the value of the inverse
##    of a matrix so that when the user need it again, he can look up in
##    the cache for the value of the inverse rather than recompute it
##
##    First, put the matrix you want to invert into a container variable
##    using the function makeCacheMatrix. You can access the value of the
##    matrix with the function get of the container. Then invert the matrix
##    with the function cacheSolve
##
## > x <- makeCacheMatrix(matrix(runif(9), nr=3, nc=3))
## > A <- x$get()
## > B <- cacheSolve(x)
##
##     You can verify that A %*% B = B %*% A = Identity matrix


##    This function takes a matrix as input and
##    returns a container which is a list of four functions:
##    - get() returns the value of the matrix that you want to invert
##    - set(matrix) sets the value of the matrix that you want to invert
##    - getinv() returns the value of the inverse of the matrix
##    - setinv(inverse_matrix) sets the value of the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
        xinv <- NULL
        set <- function(y) {
                x <<- y
                xinv <<- NULL
        }
        get <- function() x
        setinv <- function(inverse) xinv <<- inverse
        getinv <- function() xinv
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}


##    This function takes the container returned by makeCacheMatrix as input
##    and returns the inverse of the matrix. If the inverse has been computed
##    previously, the function returns the value stored in the cache instead
##    of recomputing the inverse

cacheSolve <- function(x, ...) {
        xinv <- x$getinv()
        if(!is.null(xinv)) {
                message("getting cached data")
                return(xinv)
        }
        data <- x$get()
        xinv <- solve(data, ...)
        x$setinv(xinv)
        xinv
}
