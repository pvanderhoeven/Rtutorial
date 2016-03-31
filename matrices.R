A <- matrix(1:10, nrow = 5)
A
B <- matrix(21:30, nrow = 5)
C <- matrix(21:40, nrow = 2)
B
C
nrow(A)
ncol(A)
dim(A)

A
B
A+B
A*B
A ==B

ncol(A)
ncol(B)

#t = transpose function. Flips matrix
t(B)

# dot product = %*%. Kan alleen bij identiek aantal kolommen
A %*% t(B)
A%*% C

colnames(A)
rownames(A)
colnames(A) <- c("Left", "Right")
rownames(A) <- c("1st", "2nd", "3rd", "4th", "5th")
A
colnames(B) <- c("First", "Second")
rownames(A) <- c("One", "Two", "Three", "Four", "Five")

# LETTERS geeft je hoofdletters A-Z als output
# letters geeft je kleine letters a-z als output

LETTERS
letters

colnames(C) <- LETTERS[1:10]
rownames(C) <- c("Top", "Bottom")
C

A
t(A)

# bij dot product rownames van A en colomnames van C
A%*% C
