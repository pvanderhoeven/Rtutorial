#run LinearModelsLogisticModels.R prior this file
# mean squared error formula
head(acs)
require(glmnet)
# glmnet can't feed it a formula. You need to feed it a predictor matrix and a response matrix
require(useful)

# build matrix
# can't feed it categorical data
acsX <- build.x(Income ~ NumBedrooms + NumChildren + NumPeople + NumRooms +
                  NumUnits + NumVehicles + NumWorkers + OwnRent + YearBuilt +
                  ElectricBill + FoodStamp + HeatingFuel + Insurance + Language -1,
                data = acs, contrasts = FALSE)
?build.x()
class(acsX)
dim(acsX)
topleft(acsX, c=6)
topright(acsX, c=6)

acsY <- build.y(Income ~NumBedrooms + NumChildren + NumPeople + NumRooms +
                  NumUnits + NumVehicles + NumWorkers + OwnRent + YearBuilt +
                  ElectricBill + FoodStamp + HeatingFuel + Insurance + Language -1,
                data = acs)
head(acsY)
tail(acsY)

# random number creation
?set.seed()
set.seed(1863561)
acsCV1 <- cv.glmnet(x=acsX, y=acsY, family="binomial", nfold=5)
