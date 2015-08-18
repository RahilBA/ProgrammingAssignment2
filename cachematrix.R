## makeCacheMatrix returns a list of functions to:
## 1.Set the value of the matrix
## 2.Get the value of the matrix
## 3.Set the value of the inverse
## 4.Get the value of the inverse

makeCacheMatrix <- function(x = matrix()) { ## Create a matrix x that can cache its inverse
m <- NULL  ## Define the cache m

set <- function(y){
    x <<- y 
    ## assign the input matrix y to the variable x
    ## in the parent environment to null
}
get <- function()x  ## return the matrix x
setinverse <- function(inverse)m <<- inverse  ## set the cache m equal to the inverse of matrix x
getinverse <- function()m ## return the chached inverse of x
list( set=set , get=get , setinverse=setinverse , getinverse=getinverse)
}

## the following function calculates the inverse
## of created matrix that is created before. If so,
## it gets the inverse from the cache and skips 
## the computation. Otherwise, it calculates the
## the matrix inverse and sets the value of the 
## inverse in the cache via the setinverse function.

cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
 m<- x$getinverse()
## if the inverse has already been calculate
## get it from the cache and skips the computation.
if(!is.null(m)){
	message("getting cached data")
	return(m)
}
##The inverse is not calculated yet,so calculate it  
data <- x$get()
m <- solve(data, ...)  
x$setinverse(m)
m  ##Return the cached inverse
}
