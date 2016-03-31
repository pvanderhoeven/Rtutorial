use.switch <- function(x){
  switch(x,
         "a"="First",
         "b"="Second",
         "z"="Last",
         "c"= "Third",
         "other")
}
use.switch("a")
use.switch("b")
use.switch("c")
use.switch("z")
use.switch("bla")
#finds first argument
use.switch(1)
#finds second argument
use.switch(2)
use.switch(3)
use.switch(5)
#returns NULL because out of range of switch statement
use.switch(6)
is.null(use.switch(6))
