# ARIMA = Autoregressive integrated moving average
require(forecast)
usBest <- auto.arima(x=us)
usBest
acf(usBest$residuals)
pacf(usBest$residuals)

coef(usBest)
predict(usBest, n.ahead=5, se.fit=TRUE)
theForecast <- forecast(object = usBest, h = 5)

plot(theForecast)