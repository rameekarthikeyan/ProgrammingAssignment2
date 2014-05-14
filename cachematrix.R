## The pair of functions below will create a special
## vector and get the inverse of the matrix from cache
## if exists in cache. otherwise it will calculate the
## inverse of the matrix.
 
## First function below will create a special vector
## that will return list of functions
## Second function will use the list that was returned 
## by the first function to get the inverse from
## cache

makeCacheMatrix <- function(x = matrix()) {
## writing a function for creating a special vector (list)
  
  inverse <<- NULL
## initializing the inverse of the matrix object "inverse" as NULL
  
  set <- function(y) { 
## creating a function for setting the object matrix
  
  x <<- y 
## setting the cache matrix
  
  inverse <<- NULL 
## setting the inverse of the matrix object "inverse" as NULL
	      }
  
  get <- function() { 
## creating a function for getting the object matrix
  
  x 
## returning the object matrix
	      }
  
  inversecalc <- function(solve) { 
## creating a function for setting the inverse of the matrix
  
  inverse <<- solve 
## setting the inverse of the matrix to the object matrix "inverse"
	      }
  
  getinverse <- function() { 
## creating a function for getting the inverse matrix
  
  inverse 
## returning the inverse matrix
	      }
  list(set = set, get = get, inversecalc = inversecalc, getinverse = getinverse) 
## creating the list of the functions and 
## this will be the return of the value of the function "makeCacheMatrix"
              }



cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
## writing a function for getting the inverse of the matrix 
## that was obtained from above function from cache
## the formal argument for this function will be the function "makeCacheMatrix"
## ... indicates that the arguments will be 
## inherited from the original function "makeCacheMatrix"
   
   inverse <- x$getinverse()
## Get the inverse of the matrix if existed in cache
   
   if (!is.null(inverse)) {
## if the inverse of the matrix doesn't exist in cache, then this "if" statement
## return FALSE. This "If" statement is checking the condition 
## that inverse of the matrix
## exists in cache and will return the "inverse"
## object matrix with the message if the condition is TRUE.

   message("getting the inverse from cache")
   return(inverse)
             }
## If the "If" statement condition is not met then the inverse of the matrix
## is calculated
   
   data <- x$get()
## setting the object "data" by calling 
## "get" function defined in "makeCacheMatrix""
   
   inverse <- solve(data)
## inverse of the matrix is calculated by using "Solve" function
   
   x$inversecalc(inverse)
## the inverse of the matrix object is set to the object matrix "inverse"
## by calling the function "inversecalc"
   
   inverse
## "inverse" object matrix is returned
					        
             }
