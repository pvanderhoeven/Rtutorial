# preparation for multiple regression
housing <- read.table("data/housing.csv", sep = ",", header = TRUE, stringsAsFactors = TRUE)
head(housing)
nrow(housing)
summary(housing)

#clean up column names
names(housing) <- c("Neigborhood", "Class", "Units", "Yearbuilt", "SqFt",
                     "Income", "IncomePerSqFt", "Expense", "ExpensePerSqFt",
                     "Netincome", "Value", "ValuePerSqFt", "Boro")
head(housing)

require(ggplot2)
ggplot(housing, aes(x=ValuePerSqFt)) + geom_histogram(binwidth=10) +
  labs(x="Value per Square Foot")
# end result is not normally distributed. It contains 2 modes

# fill= Boro => broken down by Boro
ggplot(housing, aes(x=ValuePerSqFt, fill=Boro)) + geom_histogram(binwidth=10) +
  labs(x="Value per Square Foot")

ggplot(housing, aes(x=ValuePerSqFt, fill=Boro)) + geom_histogram(binwidth=10) +
  labs(x="Value per Square Foot") + facet_wrap(~Boro)

# graph shows there's some miss data on the right side 
ggplot(housing, aes(x=SqFt)) + geom_histogram()

ggplot(housing, aes(x=SqFt, y=  ValuePerSqFt)) + geom_point()

#exclude data with less than 1000 units
ggplot(housing[housing$Units < 1000, ], aes(x=SqFt)) + geom_histogram()

ggplot(housing[housing$Units < 1000, ], aes(x=SqFt, y=  ValuePerSqFt)) + geom_point()

# Total of 6 houses with more than 1000 units
sum(housing$Units >= 1000)

# remove them
housing <- housing[housing$Units < 1000,]

