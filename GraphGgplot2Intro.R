require(ggplot2)


#initialize the plot
ggplot(data)
geom_point()
geom_histogram()
geom_line()

# most important function. Static mapping of x and y axes
aes()

# ggplot is build upon layers seperated by "+" sign. So i.e. for ascatter plot
ggplot(data) + geom_point(aes(x,y))
