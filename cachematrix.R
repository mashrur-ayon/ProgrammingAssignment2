## R Script for the completion of Week 3 assignment by Mashrur Arafin Ayon
## This script is written to help solve time-consuming calculation in short time using cachedata
## The function is divided into two basic segments

## In the first segment I ensure the process to use cache data

makeCacheMatrix <- function(x = matrix()) {
  
  k <- NULL
  set <- function(y){
    x <<- y
    k <<- NULL
  }
  get <- function()x
  setInverse <- function(inverse) k <<- inverse
  getInverse <- function() k 
  list(set = set, get = get, 
       setInverse = setInverse, 
       getInverse = getInverse)

}


## In the second segment I am using the cached data.
## It will reduce the calculation time. 

cacheSolve <- function(x, ...) {
        
  #Introducing the inverse of matrix "x"
  k <- x$getInverse()
  if(!is.null(k)){
    message("getting cached data")
    return(k)
  }
  mat <- x$get()
  k <- solve(mat,...)
  x$setInverse(k)
  k
}
