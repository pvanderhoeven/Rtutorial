require(UsingR)
head(father.son)

require(ggplot2)
ggplot(father.son, aes(x=fheight, y=sheight)) + geom_point() +
  geom_smooth(method="lm") + labs(x="Fathers", y="Sons")

# sheight = the response (the y variable), fheight = the predictor (the x variable)
heightsLM <- lm(sheight ~ fheight, data=father.son)
heightsLM
# y = a + bx + E
# Coefficient = b
# Intercept = a

summary(heightsLM)

#Anova
data(tips, package = "reshape2")
head(tips)

tipsAnova <- aov(tip ~ day -1, data=tips)
tipsLM <- lm(tip ~ day -1, data = tips)

summary(tipsAnova)
summary(tipsLM)


