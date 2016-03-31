theMatrix <- matrix(1:9, nrow = 3)
theMatrix

# get sum of each colomn. Apply expects a matrix. If you supply a data frame, it will first convert it into a matrix. Column is 2nd MARGIN
apply(theMatrix, MARGIN = 2, sum)
# sum up the rows. row is MARGIN=1
apply(theMatrix, MARGIN = 2, sum)

colSums(theMatrix)
rowSums(theMatrix)

# Let's make missing data
theMatrix[2,1] <- NA
theMatrix

apply(theMatrix, 1, sum)

# Removes any NA data
apply(theMatrix, 1, sum, na.rm=TRUE)
rowSums(theMatrix)

rowSums(theMatrix, na.rm = TRUE)
