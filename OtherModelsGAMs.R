# GAMS's = Generalized additive model
# it lets you combine variable with functions of variables to fit a regression

# original data -> http://archive.ics.edu/ml/machine-learning-databases/statlog/german/german.data

load("data/credit.rdata")
require(useful)
require(ggplot2)
head(credit)
ggplot(credit, aes(x=CreditAmount, y=Credit)) +
  geom_jitter(position = position_jitter(height = .2)) +
  facet_grid(CreditHistory ~ Employment) +
  xlab("Credit_Amount") + 
  theme(axis.text.x= element_text(angle=90, hjust = 1, vjust=.5)) +
        scale_x_continuous(labels=multiple)

# GAM to fit together the data
require(mgcv) 
# te = tensor product
# s = spline
?te
creditGAM <- gam(Credit ~ te(CreditAmount) + s(Age) + CreditHistory + Employment,
                 data=credit, family = binomial(link="logit"))
summary(creditGAM)
# for creditAmount
plot(creditGAM, select=1, se=TRUE, shade=TRUE)
# for age
plot(creditGAM, select=2, se=TRUE, shade=TRUE)
