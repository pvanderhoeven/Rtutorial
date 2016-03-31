require(ggplot2)
data("diamonds")
head(diamonds)

plot(diamonds$carat, diamonds$price)

#alternatieve notatie
plot(price ~ carat, data = diamonds)

plot(price ~ carat, data = diamonds, main="Price vs Carat")
