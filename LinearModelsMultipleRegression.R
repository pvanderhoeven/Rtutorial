# B = (x^T * X)^-1 * X^T * Y
head(housing)

# lm = linear model
house1 <- lm(ValuePerSqFt ~ Units + SqFt + Boro, data = housing)  
summary(house1)


# it doesn't list the Boro of the Bronx, due to the matrix algebra
# matrix algebra limitation => multicollinearity(any combination of collumns can't equal another collumn)
head(model.matrix(ValuePerSqFt ~ Boro, data = housing))
# 5 levels of ValuePerSqFt, 4 dummy. If all the dummys are 0, then it's the Boro Bronx. 
# Due to the intercept, that is 1 (multicollinearity)

house1$coefficients
coef(house1)
coefficients(house1)

summary(house1)

require(coefplot)
coefplot(house1)

house2 <- lm(ValuePerSqFt ~ Units * SqFt + Boro, data = housing)  
coefplot(house2)

head(model.matrix(ValuePerSqFt ~ Units * SqFt, data = housing))
# only gives interaction
head(model.matrix(ValuePerSqFt ~ Units:SqFt, data = housing))


house3 <- lm(ValuePerSqFt ~ Units:SqFt + Boro, data = housing)  
coefplot(house3)

# 3 way interaction
house4 <- lm(ValuePerSqFt ~ SqFt*Units*Income, housing)  
coefficients(house4)
coefplot(house4)

# Class and Boro are both text values. Creates dummy values
house5 <- lm(ValuePerSqFt ~ Class*Boro, data = housing)  
coefficients(house5)
coefplot(house5)

# use ratio. Use I function
?I()
house6 <- lm(ValuePerSqFt ~ I(SqFt/Units) + Boro, data = housing)  
coefficients(house6)
coefplot(house6)

# shortcut
house7 <- lm(ValuePerSqFt ~ (Units + SqFt)^2, data = housing)
coefficients(house7)
coefplot(house7)
house8 <- lm(ValuePerSqFt ~ Units * SqFt, data = housing)
coefficients(house8)

house9 <- lm(ValuePerSqFt ~ I(Units + SqFt)^2, data = housing)
coefficients(house9)

# multiplot from coef package
multiplot(house1, house2, house3)

housingNew <- read.table("data/housingNew.csv", sep = ",", header = TRUE, stringsAsFactors = FALSE)
head(housingNew)

housePredict <- predict(house1, newdata = housingNew, se.fit = TRUE, 
                        interval="prediction", level = .95)
head(housePredict$fit)
