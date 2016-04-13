load("data/ideo.rdata")
head(ideo)

# plot model for each year
theYears <- unique(ideo$Year)
results <- vector(mode = "list", length=length(theYears))
results
names(results) <- theYears

# build loop on each year of the data
for(i in theYears) {
  results[[as.character(i)]] <- glm(Vote ~ Race + Income + Gender + Education,
                                    data=ideo, subset = Year == i,
                                    family = binomial(link = "logit"))
}

require(coefplot)
voteInfo <- multiplot(results, coefficients = "Raceblack", plot=FALSE)
head(voteInfo)

multiplot(results, coefficients = "Raceblack", secret.weapon = TRUE)

# zoom in plot
multiplot(results, coefficients = "Raceblack", secret.weapon = TRUE) + coord_flip(xlim=c(-20,10))

# use weakly  informative prior
# and Bayesian regression
resultsB <- vector(mode = "list", length=length(theYears))
names(resultsB) <- theYears

# arm::bayesglm let you use arm package from
for(i in theYears) {
  resultsB[[as.character(i)]] <- arm::bayesglm(Vote ~ Race + Income + Gender + Education,
                                               data=ideo[ideo$Year == i, ],
                                               family = binomial(link = "logit"),
                                               prior.scale = 2.5,
                                               prior.df = 1)
}
require(coefplot)
multiplot(resultsB, coefficients = "Raceblack", secret.weapon = TRUE)
