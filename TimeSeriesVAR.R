# VAR = Vector Auto Regressive
# required ro run TimeSerieAcfPacf.R prior to this
head(gdp)
require(reshape2)

gdpCast <- dcast(Year ~ Country, data= gdp[, c("Country", "Year", "PerCapGDP")],
                 value.var = "PerCapGDP")
head(gdpCast)
gdpTS <- ts(data = gdpCast[, -1], start=min(gdpCast$Year), end = max(gdpCast$Year))
plot(gdpTS, plot.type = "single", col=1:8)
legend("topleft", legend=colnames(gdpTS), ncol = 2, lty=1, col=1:8, cex = .9)

# the data is not stationary
# dif the data
require(forecast)
numDiffs <- ndiffs(gdpTS)
numDiffs

gdpDiffed <- diff(gdpTS, differences = numDiffs)
plot(gdpDiffed, plot.type = "single", col=1:8)

#VAR
require(vars)

gdpVAR <- VAR(gdpDiffed, lag.max = 12)
#number of lags is 6
gdpVAR$p

# shows 7 different models (per country)
names(gdpVAR$varresult)

# each model is a lm model
class(gdpVAR$varresult$Canada)

# each model has it's own coef
head(coef(gdpVAR$varresult$Canada), 10)

require(coefplot)
coefplot(gdpVAR$varresult$Canada)
coefplot(gdpVAR$varresult$Netherlands)

predict(gdpVAR,n.ahead = 5)

