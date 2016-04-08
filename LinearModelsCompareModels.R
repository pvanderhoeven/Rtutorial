housing <- read.table("data/housing.csv", sep = ",", header = TRUE, stringsAsFactors = TRUE)

house1 <- lm(ValuePerSqFt ~ Units + SqFt + Boro, housing)
house2 <- lm(ValuePerSqFt ~ Units * SqFt + Boro, housing)
house3 <- lm(ValuePerSqFt ~ Units + SqFt * Boro + Class, housing)
house4 <- lm(ValuePerSqFt ~ Units + SqFt * Boro + SqFt * Class, housing)
house5 <- lm(ValuePerSqFt ~ Boro + Class, housing)

multiplot(house1, house2, house3, house4, house5, pointSize = 2)

anova(house1, house2, house3, house4, house5)
# RSS lower is better fit. Overfitting by more variables

# AIC and BIC take complexity into account
# AIC = Akaike information criterion
# BIC = Bayesian information criterion
AIC(house1, house2, house3, house4, house5)
BIC(house1, house2, house3, house4, house5)
# model 4 is the best

# for rlm you use deviance
housing$HighValue <- housing$ValuePerSqFt > 150
high1 <- glm(HighValue ~ Units + SqFt + Boro, housing, family=binomial(link = "logit"))
high2 <- glm(HighValue ~ Units * SqFt + Boro, housing, family=binomial(link = "logit"))
high3 <- glm(HighValue ~ Units + SqFt * Boro + Class, housing, family=binomial(link = "logit"))
high4 <- glm(HighValue ~ Units + SqFt * Boro + SqFt * Class, housing, family=binomial(link = "logit"))
high5 <- glm(HighValue ~ Boro + Class, housing, family=binomial(link = "logit"))

anova(high1,high2,high3,high4,high5)
# for every 1 coefficient, you want deviants drop 2
# drop and deviance test


AIC(high1,high2,high3,high4,high5)
BIC(high1,high2,high3,high4,high5)
# fro AIC model 4 is the best, For BIC model 5