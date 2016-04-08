# k-fold cross validation
require(boot)

# The glm function is required (not the lm function)
housing <- read.table("data/housing.csv", sep = ",", header = TRUE, stringsAsFactors = TRUE)
head(housing)
names(housing) <- c("Neigborhood", "Class", "Units", "Yearbuilt", "SqFt",
                    "Income", "IncomePerSqFt", "Expense", "ExpensePerSqFt",
                    "Netincome", "Value", "ValuePerSqFt", "Boro")
houseG1 <- glm(ValuePerSqFt ~ Units + SqFt + Boro, data=housing,
               family = gaussian(link="identity"))
# cv.glm = Cross-validation k-fold
?cv.glm()
houseCV1 <- cv.glm(housing, houseG1, K=5)
houseCV1
# cross validated error and the adjusted cross validated error
houseCV1$delta

# MSE => mean squared error 
houseG2 <- glm(ValuePerSqFt ~ Units*SqFt + Boro, data=housing)
houseG3 <- glm(ValuePerSqFt ~ Units + SqFt * Boro + Class, data=housing)
houseG4 <- glm(ValuePerSqFt ~ Units + SqFt * Boro + SqFt*Class, data=housing)
houseG5 <- glm(ValuePerSqFt ~ Boro + Class, data=housing)

houseCV2 <- cv.glm(housing, houseG2, K=2)
houseCV3 <- cv.glm(housing, houseG3, K=2)
houseCV4 <- cv.glm(housing, houseG4, K=2)
houseCV5 <- cv.glm(housing, houseG5, K=2)

# set in data frame
cvResults <- as.data.frame(rbind(houseCV1$delta, houseCV2$delta, houseCV3$delta, 
                                 houseCV4$delta, houseCV5$delta))
names(cvResults) <- c("Error", "Adjusted.Error")
cvResults$model <- sprintf("houseG%s", 1:5)
cvResults
# the lower the MSE, the better

cvAnova <- anova(houseG1, houseG2, houseG3, houseG4, houseG5)
cvAic <- AIC(houseG1, houseG2, houseG3, houseG4, houseG5)

cvResults$Anova <- cvAnova$`Resid. Dev`
cvResults$Aic <- cvAic

cvResults
