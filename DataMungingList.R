# via lapply

theList <- list(A=matrix(1:9, nrow=3), B=1:5, C=matrix(1:4, 2), D=2) 
theList

# returns the sum of the lists
lapply(theList, sum)

# sapply return a vector instead of a list
sapply(theList, sum)

theNames <- c("Peter", "Mel", "Wende")
# geeft de character count van de namen
lapply(theNames, nchar)

