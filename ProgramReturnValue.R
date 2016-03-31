double.num <- function(x){
  x*2
}
double.num(3)
double.num(5)

double.num <- function(x){
  return(x*2)
}
double.num(3)

# everything that come after return statement doesn't get executed
double.num <- function(x){
  return(x*2)
  print("Hello")
  return(17)
}
double.num(3)
