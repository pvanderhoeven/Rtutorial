housing <- read.table("data/housing.csv", sep = ",", header = TRUE, stringsAsFactors = TRUE)
head(housing)

house1 <- lm(ValuePerSqFt ~ Units + SqFt + Boro, data=housing)
summary(house1)

coefplot(house1)

?fortify()
head(fortify(house1))

require(ggplot2)
# fortify goes automaticly
h1 <- ggplot(aes(x=.fitted, y=.resid), data = house1) + geom_point() + geom_hline(yintercept=0) +
  geom_smooth(se=FALSE) + labs(x="Fitted values", y="Residuals")
h1
h1 + geom_point(aes(color=Boro))


# Q–Q plot (quantile)
plot(house1, which = 2)
# should be a straight line
# same graph via ggplot
ggplot(house1, aes(sample=.stdresid)) + stat_qq() + geom_abline()

ggplot(house1, aes(x=.resid)) + geom_histogram()

