tomato <- read.table(file="/Users/petervanderhoeven/R/Rtutorial/data/Tomato First.csv", header = TRUE, 
                     sep=",", stringsAsFactors = FALSE)
head(tomato)

save(tomato, file = "/Users/petervanderhoeven/R/Rtutorial/data/tomato.rdata")
rm(tomato)
tomato

# tomato object name stays the same
load("/Users/petervanderhoeven/R/Rtutorial/data/tomato.rdata")
head(tomato)

n <- 20
r <- 1:10
w <- data.frame(n,r)
w

#  save objects in rdata file
save(n, r, w, file = "/Users/petervanderhoeven/R/Rtutorial/data/multiple.rdata")
rm(n, r, w)
w
load("/Users/petervanderhoeven/R/Rtutorial/data/multiple.rdata")
n
r
w
