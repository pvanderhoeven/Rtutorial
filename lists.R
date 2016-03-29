list1 <- list(1, 2, 3)
list1
list2 <- list(c(1,2,3))
list2
list3 <- list(c(1,2,3), 3:7)
list3

theDF <- data.frame(First=1:5, Second=5:1, 
                    Sport=c("hockey", "voetbal", "zwemmen", 
                            "tennis", "boksen"), stringsAsFactors = FALSE)
theDF
list4 <- list(theDF, 1:10)
list4

list5 <- list(theDF, 1:10, list3)
list5


names(list5) <- c("dataframe", "vector", "list")
names(list5)
list5


list6 <- list(TheDataFrame=theDF, TheVector=1:10, TheList=list3)
names(list6)
list6

emptyList <- vector(mode="list", length = 4)
emptyList[[1]] <- 5:100
emptyList


list5[[1]]
list5[["dataframe"]]
list5[["dataframe"]]$Sport
list5[["dataframe"]][,"Sport", drop=FALSE]

length(list5)

list5[["NewElement"]] <- 3:6
list5
