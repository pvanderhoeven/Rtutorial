for(i in 1:10){
  print(i)
}

print(1:10)

fruit <- c("apple", "banana","orange")

# rep = repeat, repeats NA for the length of fruit
fruitLength <-rep(NA, length(fruit))
fruitLength 
names(fruitLength) <-fruit
fruitLength 

for(a in fruit){
  fruitLength[a] <- nchar(a) 
}
fruitLength 
a

fruitLength2 <- nchar(fruit)
fruitLength2
names(fruitLength2) <-fruit

# checks if 2 elements are identical
identical(fruitLength,fruitLength2)
