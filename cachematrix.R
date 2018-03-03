## makeCacheMatrix: function creates a special "matrix" object that can cache its inverse.
## cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.

## .... A function that creates a special matrix inverse thatc can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
        nv <- NULL
        set <-  function(y) { 
                x <<- y
                nv <<- NULL
        }
        get <- function() x
        setinverse<- function (solve)  nv <<- solve
        getinverse <-  function() nv
        list(set = set, get = get,
             setinverse = setinverse, getinverse = getinverse)

}



## ....This function computes the inverse of the special "matrix" returned by makeCacheMatrix above

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        nv <- x$getinverse()
        if (!is.null(nv)) {
                message("Retrieveng inverse from Cache, Saving you time")
                return (nv)
                
        }
        data <- x$get()
        nv= solve(x$get())
        x$setinverse(nv)
}
