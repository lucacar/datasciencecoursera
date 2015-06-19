## R functions to calculate matrix inverse and cache the result
## week 2 assignent

## makeCacheMatrix create a list of functions
## given a matrix as input
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  
  get <- function() x
  setInvertMatrix <- function(imatrix) { 
    m <<- imatrix
  }
  getInvertMatrix <- function () m
  
  list( 
       get = get, set = set,
       setInvertMatrix = setInvertMatrix,
       getInvertMatrix = getInvertMatrix)
}

## Cache solve will receive makecahceMatrix as input
## temp <- makeCacheMatrix(a)
## cacheSolve(temp)
cacheSolve <- function(x, ...) {
  m <- x$getInvertMatrix()
  
  if(!is.null(m)) {
    return(m)
  }
  data <- x$get()
  imatrix <- solve(data, ...)
  x$setInvertMatrix(imatrix)
  imatrix
}
