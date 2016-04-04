# aggregate = apply functions to subset of data
require(ggplot2)
data("diamonds")
head(diamonds)
mean(diamonds$price)

# avg price of diamond per cut
aggregate(price ~ cut, diamonds, mean, na.rm=TRUE)

# aggregate price on cut and color 
aggregate(price ~ cut + color, diamonds, mean )

# aggregate 2 variables by 1 variable
# cbind takes 2 columns and build matrix from them
aggregate(cbind( price, carat) ~ cut, diamonds, mean)

aggregate(cbind( price, carat) ~ cut + color, diamonds, mean)
