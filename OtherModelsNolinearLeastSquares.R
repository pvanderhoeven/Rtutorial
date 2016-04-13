load("data/wifi.rdata")
head(wifi)

require(ggplot2)
ggplot(wifi, aes(x=x, y=y, color = Distance)) + geom_point() +
  scale_color_gradient2(low = "blue", mid = "white", high = "red",
                        midpoint = mean(wifi$Distance))
# red dots means further from the hotspot    , blue means closer

# formula the distance
# nonlinear square
wifiMode1 <- nls(Distance ~ sqrt((betaX - x)^2 + (betaY - y)^2), data=wifi,
                 start=list(betaX=50, betaY=50))
summary(wifiMode1)                 
# so around (17,52)

# show result in plot
ggplot(wifi, aes(x=x, y=y, color = Distance)) + geom_point() +
  scale_color_gradient2(low = "blue", mid = "white", high = "red",
                        midpoint = mean(wifi$Distance)) +
  geom_point(data=as.data.frame(t(coef(wifiMode1))), aes(x=betaX, y=betaY), size=5, color="green")

