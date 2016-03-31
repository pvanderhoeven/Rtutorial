hello.person <-function(first, last="Jansen", ...){
  print(sprintf("Hello %s %s", first, last))
  
}
hello.person("Peter", "van der Hoeven")
do.call("hello.person", args = list(first="Peter", last="van der Hoeven"))
do.call(hello.person, args = list(first="Peter", last="van der Hoeven"))

# use function as an argument. Very powerful!
run.this <- function(x, func=mean){
  do.call(func, args=list(x))
}
run.this(1:10)
run.this(1:10, mean)
run.this(1:10, sum)
run.this(1:10, sd)
