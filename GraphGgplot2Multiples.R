# small multiples => plotting the same information with level of a certain variable = is called a facet in ggplot2

g <- ggplot(diamonds, aes(x=carat, y=price))
# break up the plot into descrete units, 1 for each level of color, and form them into a grid
g <- g + geom_point(aes(color=color)) + facet_wrap(~color)
g

# make a grid. Ech pane presents a combination between cut and clarity
# cut~clarity => cut goes down, clarity to right
g <- g + geom_point(aes(color=color)) + facet_grid(cut~clarity)
g

g <- ggplot(diamonds, aes(x=carat)) + geom_histogram() + facet_wrap(~color)
g
