acs <- read.table("data/acs_ny.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
head(acs)
ncol(acs)
nrow(acs)

# model if family income is over 100.000,-
acs$Income <- with(acs, FamilyIncome >= 150000)
?with()
head(acs$Income)

require(ggplot2)
require(useful)
ggplot(acs, aes(x=FamilyIncome)) + geom_density(filled = "grey", color = "grey") +
  geom_vline(xintercept=150000) +
  scale_x_continuous(label=multiple.dollar, limits= c(0,1000000))

# implement model 
?glm()
# glm = Generalized Linear Model. Same setup as lm. response on left. Predictors on the right
income1 <- glm(Income ~ HouseCosts + NumWorkers + OwnRent + NumBedrooms + FamilyType,
               data=acs, family = binomial(link="logit"))
summary(income1)
# deviance => how far you are from the true mark

require(coefplot)
coefplot(income1)

income1$coefficients
invlogit <- function(x){
  1/(1+exp(-x))
}
invlogit(income1$coefficients)
