# ACF = Autocrrelation Function
# PACF = Partial Autocrrelation Function

require(WDI)
countries <- c("US", "CA", "GB", "CN", "JP", "SG", "IL", "NL")
indicators <- c("NY.GDP.PCAP.CD", "NY.GDP.MKTP.CD")
tail(WDI)
gdp <- WDI(country = countries, indicator = indicators, start = 1960, end = 2011)
head(gdp)
names(gdp) <- c("isoc2", "Country", "Year", "PerCapGDP", "GDP")
head(gdp)

require(ggplot2)
require(scales)
ggplot(gdp, aes(Year, PerCapGDP, color=Country, linetype=Country)) +
  geom_line() + scale_y_continuous(label=dollar)

nl <- gdp$PerCapGDP[gdp$Country == "Netherlands"]
nl <- ts(nl, start = min(gdp$Year), end = max(gdp$Year))
nl
plot(nl,ylab="Per Capita GDP", xlab= "Year")

# ACF
acf(nl)
# PACF
pacf(nl)

