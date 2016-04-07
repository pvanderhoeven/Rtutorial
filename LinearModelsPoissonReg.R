# Poisson models count data

acs <- read.table("data/acs_ny.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
head(acs)
require(ggplot2)
ggplot(acs, aes(x=NumChildren)) + geom_histogram(binwidth=1)

children1 <- glm(NumChildren ~ FamilyIncome + FamilyType + OwnRent,
                 data = acs, family = poisson(link = "log"))
?poisson()
summary(children1)
coefplot(children1)

# Overdispersion
z <- (acs$NumChildren - children1$fitted.values)/sqrt(children1$fitted.values)
sum(z^2) / children1$df.residual
?pchisq()
# Chi-Squared Distribution
pchisq(sum(z^2), df= children1$df.residual)

children2 <- glm(NumChildren ~ FamilyIncome + FamilyType + OwnRent,
                 data=acs, family = quasipoisson(link="log"))
multiplot(children1, children2)
