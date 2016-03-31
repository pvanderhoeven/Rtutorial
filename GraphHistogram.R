require(ggplot2)
data("diamonds")
head(diamonds)

#histogram
hist(diamonds$carat)

# xlab = x as
hist(diamonds$carat, main = "catat histogram", xlab = "carat")

