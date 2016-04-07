data("tips", package = "reshape2")
head(tips)
unique(tips$sex)
unique(tips$day)

# t test
# 2.5 is the Null hypothesis => TRUE unless proven different
# p value should be less than 0.5
t.test(tips$tip, alternative = "two.sided", mu = 2.5)
?t.test()

require(ggplot2)
# create random numbers
randT <- rt(30000, df=NROW(tips)-1)
tipTTest <- t.test(tips$tip, alternative = "two.sided", mu = 2.5)
ggplot(data.frame(x=randT)) +
  geom_density(aes(x=x), fill="grey", color="grey") +
  geom_vline(xintercept=tipTTest$statistic) +
  geom_vline(xintercept=mean(randT) + c(-2,2)*sd(randT), linetype=2)
  
# 1 sided t test
t.test(tips$tip, alternative = "greater", mu=2.5)

aggregate(tip ~ sex, data=tips, mean)
aggregate(tip ~ sex, data=tips, var)

# shapiro test
shapiro.test(tips$tip)
shapiro.test(tips$tip[tips$sex == "Female"])
shapiro.test(tips$tip[tips$sex == "Male"])

ggplot(tips, aes(x=tip, fill=sex)) + geom_histogram(binwidth=.5, alpha=1/2)

# Ansari-Bradley test
ansari.test(tip ~ sex, tips)
t.test(tip ~ sex, data = tips, var.equal=TRUE)

require(plyr)
tipSummary <- ddply(tips, "sex", summarize,
                    tip.mean=mean(tip), tip.sd=sd(tip),
                    Lower=tip.mean - 2*tip.sd/sqrt(NROW(tip)),
                    Upper=tip.mean + 2*tip.sd/sqrt(NROW(tip)))
# Gives mean, sd, Lower and Upper per sex
tipSummary

ggplot(tipSummary, aes(x=tip.mean, y=sex)) + geom_point() + 
  geom_errorbarh(aes(xmin=Lower, xmax=Upper), height = .2)

          
# paired t test
require(UsingR)
head(father.son)
t.test(father.son$fheight, father.son$sheight, paired = TRUE)

# If you have more than 2 samples. Use anova formula
# to check if tips vary by day

# the -1, because you want to run without the intercept
tipsAnova <- aov(tip ~ day -1, tips)
tipsIntercept <- aov(tip ~ day, tips)
tipsAnova$coefficients
tipsIntercept$coefficients

summary(tipsAnova)

tipsByDay <- ddply(tips, "day", summarise,
                   tip.mean=mean(tip), tip.sd=sd(tip),
                   Length=NROW(tip),
                   tfrac=qt(p=.90, df=Length-1),
                   Lower=tip.mean - tfrac*tip.sd/sqrt(Length), 
                   Upper=tip.mean + tfrac*tip.sd/sqrt(Length))

ggplot(tipsByDay, aes(x=tip.mean, y=day)) + geom_point() + 
  geom_errorbarh(aes(xmin=Lower, xmax=Upper), height=.3) 