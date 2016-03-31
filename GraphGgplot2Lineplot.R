head(economics)
ggplot(economics, aes(x=date, y=pop)) +geom_line()

#trend
require(lubridate)
# make new variable
economics$year <- year(economics$date)
economics$month <- month(economics$date)
head(economics)

# make a subset of economics data
econ2000 <- economics[which(economics$year >= 2000),]
nrow(economics)
nrow(econ2000)

# changes monthnumbers  in monthnames
head(econ2000)
econ2000$month <- month(econ2000$date, label = TRUE)
head(econ2000)

# by changing year into a factor the color will change instead of sahdes of the same color
require(scales)
require(ggplot2)
g <- ggplot(econ2000, aes(x = month, y = pop))
g <- g + geom_line(aes(color=factor(year), group=year))

# change factor(year) into year in legenda
g <- g + scale_color_discrete(name = "Year")

# change y axis labels
g <- g + scale_y_continuous(labels=comma)

# Set label header, x and y
g <- g + labs(title="Population Growth", x="Month", y="Population")
g

# change label of months to vertical
g <- g + theme(axis.text.x=element_text(angle = 90, hjust=1))
g

