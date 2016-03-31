1 == 1
1 < 1
1 <= 1
1 > 1
1 != 1

toCheck <- 1
if(toCheck == 1){ 
  print("Hello")
}

check.bool <- function(x){
  if(x==1){
    print("Hello")
  } else {
    print("Goodbye")
  }
}
check.bool(1)
check.bool(0)
check.bool("bla")
# TRUE = 1
check.bool(TRUE)

# else if statement
check.bool <- function(x){
  if(x==1){
    print("Hello")
  } else if (x==0){
    print("Goodbye")
  } else {
    print("confused")
  }
}
check.bool(1)
check.bool(0)
check.bool("bla")


