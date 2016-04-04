# Statistics => propability distribution
# normal distribution / bell curve

# create 10 numbers from teh normal distribution
rnorm(10)

# sd = standard deviation
rnorm(10, mean = 100, sd = 20)

randNorm10 <- rnorm(10)
randNorm10

# probability via dnorm. 0.16221733 = 16% chance
dnorm(randNorm10)
dnorm(c(-1,0,1))

# create 30k random numbers, plot and calculate dnorm
 require(ggplot2)
randNorm <- rnorm(30000)
randDensity <- dnorm(randNorm)
ggplot(data.frame(x=randNorm, y=randDensity)) + aes(x=x, y=y) +
  geom_point() + labs(x="Random Variables", y="Density")

# probability number, probablity of getting each of the numbers or less
pnorm(randNorm10)
pnorm(c(-3,0,3))
pnorm(1) - pnorm(0)

# quantile. Given a certain probability, it tells you what the origional number was
randNorm10
pnorm(randNorm10)
# The quantiles of the pnorm should be the same as the randNorm10
qnorm(pnorm(randNorm10))

identical(randNorm10, qnorm(pnorm(randNorm10)))

# binomial distribution. a serie where teh result can be yes / no, true / false etc
rbinom(n=1, size=10, prob= 0.4)
rbinom(n=5, size=10, prob= 0.4) 
rbinom(n=5, size=10, prob= 0.4) 
rbinom(n=1, size=1, prob= 0.4) 

binomData <- data.frame(Success=rbinom(n=10000, size = 10, prob = 0.3))
ggplot(binomData, aes(x=Success)) + geom_histogram(binwidth=1)

binom5 <- data.frame(Successes=rbinom(n=10000, size = 5, prob = 0.3), Size=5)
head(binom5)
binom10 <- data.frame(Successes=rbinom(n=10000, size = 10, prob = 0.3), Size=10)
binom100 <- data.frame(Successes=rbinom(n=10000, size = 100, prob = 0.3), Size=100)
binom1000 <- data.frame(Successes=rbinom(n=10000, size = 1000, prob = 0.3), Size=1000)

# bind them together
binomAll <- rbind(binom5, binom10, binom100, binom1000)
head(binomAll)
tail(binomAll)
ggplot(binomAll, aes(x=Successes)) + geom_histogram() + 
  facet_wrap(~Size, scales = "free")

# get distribution of binomial 
dbinom(x=3, size = 10, prob = 0.3)

# get probablity of 3 or less successes => pbinom()
pbinom(q=3, size = 10, prob = 0.3)

# quantile of binomial
qbinom(p=0.3, size = 5, prob = 0.3)

# with vector
qbinom(p=c(.3, .35, .4, .5, .6), size = 10, prob = 0.3)


# Poisson distribution.
# lambda = mean of distribution
pois1 <- rpois(n=10000, lambda = 1)
pois2 <- rpois(n=10000, lambda = 2)
pois5 <- rpois(n=10000, lambda = 5)
pois10 <- rpois(n=10000, lambda = 10)
pois20 <- rpois(n=10000, lambda = 20)
pois50 <- rpois(n=10000, lambda = 50)
pois <- data.frame(Lambda.1=pois1, Lambda.2=pois2, Lambda.5=pois5, Lambda.10=pois10,
                   Lambda.20=pois20, Lambda.50=pois50)
head(pois)

# plotting in long format
require(reshape2)
pois <- melt(data=pois, variable.name="Lambda", value.name = "x")
head(pois)
tail(pois)
# to remove Lambda
require(stringr)
pois$Lambda <- str_extract(string = pois$Lambda, pattern = "\\d+")
head(pois)
tail(pois)
class(pois$Lambda)

# 2 step (first from character to numeric, then to factor) is necessary 
pois$Lambda <- as.factor(as.numeric(pois$Lambda))
tail(pois)

# alpha 1/2 = half transparent
ggplot(pois, aes(x=x)) + geom_density(aes(group=Lambda, color=Lambda, fill = Lambda), 
      adjustment =4, alpha = 1/2) + scale_color_discrete() + 
      scale_fill_discrete() + ggtitle("Probability Mass function")
