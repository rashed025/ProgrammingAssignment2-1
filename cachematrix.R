## makeCacheMatrix() builds a set of four functions and returns them within a list to the parent environment
## It creates an R oject that stores a matrix and its inverse.
## cacheSolve () requires an argument that is returned from the makeCacheMatrix () to retrieve the inverse of the cached matrix that is stored in the makeCacheMatrix () environment 

## 

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y){
    x <<- y
    inv <<- NULL
  }
  get <- function ()x
  setInverse <- function()  inv <<- solve (x)
  getInverse <- function() inv
  list(set=set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## The function attempts to retrieve inverse from the object passed in as the argument. First, it calls the getInverse() function on the input object
## It checks whether the inverse is NULL and if FALSE it calculates the inverse and uses the setInverse function  on the input object to set the inverse in the input object, and then returns the value of the inverse to the parent environment by printing the inverse object.

cacheSolve <- function(x, ...) {
  inv <- x$getInverse()
  if (!is.null(inv)) {
    message("getting cached data")
  return(inv)
 }
mat <- x$get()
inv <- solve(mat, ...)
x$setInverse(inv)
inv
}
  
        ## Return a matrix that is the inverse of 'x'

