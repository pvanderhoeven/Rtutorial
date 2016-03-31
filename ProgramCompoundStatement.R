a <- c(1,1,0,1)
b <- c(1,2,0,1)
# single & checks each element of the vector
ifelse(a == 1 & b == 1, "Yes", "No")
# double && checks first element of ech vector
ifelse(a == 1 && b == 1, "Yes", "No")

ifelse(a == 1 & b == 1, "Yes", "No")

# if double && is use, the second statement(y == 3) won't be executed. Good for computation time
x <- 1
y <- 2
if(x == 0 && y == 3){
  print("hello")
}
if(x == 0 || y == 3){
  print("hello")
}

ifelse(b == 1, "Hi", ifelse(b == 0, "Hello", "Goodbye"))
       