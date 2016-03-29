x <-10:1
y <- -4:5
q <- c("hockey", "voetbal", "tennis", "zwemmen", "schaatsen")
theDF <- data.frame(x, y, q)
theDF <- data.frame(First=x, Second=y, Sport=q)
theDF
class(theDF$Sport)


theDF <- data.frame(First=x, Second=y, Sport=q, stringsAsFactors = FALSE)
class(theDF$Sport)
nrow(theDF)
ncol(theDF)
dim(theDF)

NROW(theDF)
nrow(x)
length(x)
NROW(x)

names(theDF)
names(theDF)[3]
rownames(theDF)
rownames(theDF) <- c("Een", "Twee", "Drie", "Vier", "Vijf", "Zes", 
                     "Zeven", "Acht", "Negen", "Tien")
rownames(theDF)
rownames(theDF) <- NULL
rownames(theDF)

head(theDF, n=7)
tail(theDF, n=7)
class(theDF)

theDF$Sport
theDF[3,2]
theDF[3,2:3]
theDF[c(3,5), 2]


theDF[,3, drop=FALSE]
theDF[,3:2]

theDF[, c("First", "Sport")]
