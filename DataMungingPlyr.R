# plyr package = simplifies data munging 
require(plyr)
head(baseball)

#          H + BB + HBP
# OBP = ------------------
#       AB + BB + HBP + SF

# no SF before 1954
# convert SF before 1954 to 0

baseball$sf[baseball$year < 1954] <- 0
any(is.na(baseball$sf))

# sometimes hit by pitch (hbp) is NA
baseball$hbp[is.na(baseball$hbp)] <- 0
any(is.na(baseball$hbp))

# only players with over bats per season (ab)
# ", ]" => column argument
baseball <- baseball[baseball$ab >= 50, ] 

# with => to reduce use of baseball$
baseball$OBP <- with(baseball, (h + bb + hbp) / ab + bb + hbp + sf )
tail(baseball)


# make function for On base percentage (OBP)
obp <- function(data){
  c(OBP = with(data, sum(h + bb + hbp) / sum ( ab + bb + hbp + sf ) ))
}

# ddply function, 1st d = incoming data structure, 2nd d = outgoing data structure 
# plyr has function that take data from 1 data strucure, splits it according to a variable, operate
# on each dataset independantly and recombines them
careerOBP <- ddply(baseball, .variables = "id", obp)
head(careerOBP)

#reorder, sorting 
careerOBP <- careerOBP[order(careerOBP$OBP, decreasing=TRUE), ]
head(careerOBP)


# llply => from list to list
theList <- list(matrix(1:9, 3), B=1:5, C=matrix(1:4, 2), D=2)
theList

lapply(theList, sum)
#use llply from plyr. Is identical
llply(theList, sum)

identical(lapply(theList, sum), llply(theList, sum))

# for the return of vector use sapply. laply is identical
sapply(theList, sum)
laply(theList, sum)

head(diamonds)
# each is plyr function
aggregate(price ~ cut, diamonds, each(mean, median))

# colwise = call function to each column of the dataframe
# sum up every numeric column
numcolwise(sum, na.rm=TRUE)(diamonds)
sapply(diamonds[sapply(diamonds, is.numeric)], sum)

# plyr is slow. New version is dplyr

