# %s will add the argument
sprintf("hello %s", "Peter")
sprintf("hello %s, today is %s", "Peter", "Sunday")


# define argument and run function with argument
hello.person <- function(name){
  print(sprintf("Hello %s", name))
}

hello.person("Peter")  

# define multiple arguments
hello.person <-function(first, last){
  print(sprintf("Hello %s %s", first, last))
  
}
hello.person("Peter", "van der Hoeven")
hello.person(last="van der Hoeven", first="Peter")

# default arguments
hello.person <-function(first, last="Jansen"){
  print(sprintf("Hello %s %s", first, last))
  
}
hello.person("Peter", "van der Hoeven")
hello.person("Peter")

# geeft error
hello.person("Peter", extra="Goodbey")
hello.person("Peter", "Jansen", "Jansen")

# catch all met "...". 
hello.person <-function(first, last="Jansen", ...){
  print(sprintf("Hello %s %s", first, last))
  
}
# ignores 3rd argument 
hello.person("Peter", "Jansen", "Jansen")
# ignores wrong argument name
hello.person("Peter", extra="Goodbey")


