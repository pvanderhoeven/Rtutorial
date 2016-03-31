require(ggplot2)

ggplot(diamonds,aes(x=carat, y=price)) + geom_point()

# doesn't work. No geom defined
g <- ggplot(diamonds, aes(x=carat, y=price))
g

# works
g + geom_point()


# color code
g + geom_point(aes(color=color))

g + geom_point(aes(color=color, shape=clarity))
g + geom_point(aes(color=color, shape=cut))
