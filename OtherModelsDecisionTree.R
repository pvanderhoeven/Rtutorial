require(rpart)
load("data/credit.rdata")
head(credit)
creditTree <- rpart(Credit ~ CreditAmount + Age + CreditHistory + Employment, 
                     data = credit)
creditTree

# visualize the tree
require(rpart.plot)
rpart.plot(creditTree, extra=4)

# random forest
# fit 1000s of decision trees. It randomly picks variables and makes the fit. Avg the trees in an ansemble for predictions
require(useful)
require(randomForest)
creditFormula <- Credit ~ CreditHistory + Purpose + Employment + Duration + Age + CreditAmount
creditFormula
creditX <- build.x(creditFormula, data = credit)
creditY <- build.y(creditFormula, data = credit)
creditForest <- randomForest(x=creditX, y =creditY)
creditForest
