require(quantmod)
att <- getSymbols("T", auto.assign = FALSE)
require(xts)
head(att)
tail(att)
plot(att)

chartSeries(att)
addBBands()
addMACD(32,50,12)


# focus on closing price
attClose <- att$T.Close
class(attClose)
# xts is an extension on zoo. Zoo is a better ts object
head(attClose)

require(rugarch)
attSpec <- ugarchspec(variance.model = list(model = "sGARCH", garchOrder = c(1,1)),
                      mean.model = list(armaOrder=c(1,1)),
                      distribution.model = "std")
attGarch <- ugarchfit(spec = attSpec, data = attClose)
attGarch

plot(attGarch@fit$residuals, type = "l")
plot(attGarch, which = 10)
plot(attGarch)

attPred <- ugarchboot(attGarch, n.ahead = 50, method = c("Partial", "Full")[1])
plot(attPred, which = 2)

# [-1] excluse first one (is NA)
attLog <- diff(log(attClose))[-1]
attLogSpec <- ugarchspec(variance.model = list(model="sGARCH", garchOrder = c(1,1)),
                         mean.model = list(armaOrder = c(1,1)),
                         distribution.model = "std")
attLogGarch <- ugarchfit(spec = attLogSpec, data = attLog)
infocriteria(attGarch)
infocriteria(attLogGarch)
