# can also use http for read csv
tomato <- read.table(file="/Users/petervanderhoeven/R/Rtutorial/data/Tomato First.csv", header = TRUE, sep=",")
head(tomato)

class(tomato$Tomato)

# Always use StringsAsFactors = FALSE to speed up read
tomato <- read.table(file="/Users/petervanderhoeven/R/Rtutorial/data/Tomato First.csv", header = TRUE, 
                     sep=",", stringsAsFactors = FALSE)
class(tomato$Tomato)

#sep="\t"
#sep=";"
# Use read.csv2 for less structured data. Slower
#read.csv2()