###There are two functions below, which are to cache inverse matrix without calculating repeatedly

## This is the first function that makes a special matrix
##The sepcial matrix is to cache inverse matrix 


makeCacheMatrix <- function(x = matrix()) {
	m<-NULL
	set<-function(y){
		x<<-y
		m<<-NULL
	}
	get<-function()x
	setCacheMatri<-function(solve) m<<-solve
	getCacheMatri<-function()m
	list(set=set, get=get, setCacheMatri=setCacheMatri, getCacheMatri=getCacheMatri)

}

## This is the second function
## It is to judge whether the inverse has been calculated and then decide
## if it is neccessary to calculate again


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	m<-x$getCacheMatri()
	if(!is.null(m)){
		message("getting cached data")
		return(m)
	}
	data <-x$get()
	m<-solve(data,...)
	x$setCacheMatri(m)
	m


