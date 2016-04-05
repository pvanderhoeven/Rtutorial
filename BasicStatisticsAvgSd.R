x <- sample(x=1:100, size = 100, replace=TRUE)
x
mean(x)

y <- x

# change random position of 20 into NA
y[sample(x=1:100, size = 20, replace = FALSE)] <- NA
mean(y)
mean(y, na.rm = TRUE)

# weighted mean
grades <- c(95, 72, 87, 66)
weights <- c(1/2, 1/4, 1/8, 1/8)
mean(grades)
weighted.mean(x=grades, w=weights)

# variants
var(x)
# identical to weighted mean
sum((x - mean(x))^2)/(length(x) -1) 

# standard deviation
sqrt(var(x))
sd(x)
sd(y)
sd(y, na.rm = TRUE)

sum(x)
min(x)
max(x)

summary(x)

#quantile
quantile(x, probs = c(.25, .75))
quantile(y, probs = c(.25, .75), na.rm = TRUE)
quantile(x, probs = c(.1, .25, .75, .9))

# correlations
require(ggplot2)
head(economics)
cor(economics$pce, economics$psavert)

# correlation on columns
cor(economics[, c(2,4:6)])

econCor <- cor(economics[, c(2,4:6)])
require(reshape2)
econMelt <- melt(econCor, varnames = c("x", "y"), value.name = "Correlation")
head(econMelt)
econMelt <- econMelt[order(econMelt$Correlation), ]

require(scales)
ggplot(econMelt, aes(x=x, y=y)) + 
  geom_tile(aes(fill=Correlation)) +
  scale_fill_gradient2(low=muted("red"), mid="white", high="steelblue",
  guide=guide_colorbar(ticks = FALSE, barheight = 10), limits = c(-1, 1)) + 
  theme_minimal() + labs(x=NULL, NULL)


# dealing with missing data
m <- c(9,9,NA,3,NA,5,8,1,10,4)
n <- c(3,3,5,3,NA,5,8,1,7,4)
p <- c(9,9,NA,3,NA,5,8,1,10,4)
q <- c(9,9,NA,3,NA,5,8,1,10,4)
r <- c(9,9,NA,3,NA,5,8,1,10,4)
theMat <- cbind(m,n,p,q,r) 
theMat
cor(theMat)
cor(theMat, use = "Everything")
?cor()
# to leave NA
cor(theMat, use = "all.obs")
cor(theMat, use = "complete.obs")
cor(theMat, use = "na.or.complete")
cor(theMat[c(1,4,7,9,10),])

cor(theMat, use = "pairwise.complete.obs")
