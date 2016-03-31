require(ggthemes)
g <- ggplot(diamonds, aes(x=carat, y=price, color=color)) + geom_point()
g

# change theme to wall street journal theme
g + theme_wsj()

# change theme to economist with colour set
g + theme_economist() + scale_colour_economist()

g + theme_tufte()
g + theme_excel() + scale_colour_excel()
