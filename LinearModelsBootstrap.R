# estimate uncertainties
require(plyr)
head(baseball)
baseball <- baseball[baseball$year >= 1990, ]
head(baseball)

# you can pass in data as argument and then find the NROW of data. Not 2 steps needed
bat.avg <- function(data, indices=1:NROW(data), hits = "h", at.bats = "ab"){
  sum(data[indices, hits], na.rm = TRUE) /
    sum(data[indices, at.bats], na.rm = TRUE)
}

bat.avg(baseball)

# bootstrap
require(boot)
avgBoot <- boot(data = baseball, statistic = bat.avg, R = 1200, stype = "i")
avgBoot
boot.ci(avgBoot, conf = .95, type = "norm")

require(ggplot2)
ggplot() + geom_histogram(aes(x=avgBoot$t), fill = "grey", color = "grey") + 
  geom_vline(xintercept=avgBoot$t0 + c(-1, 1)*2* sqrt(var(avgBoot$t)), linetype=2)
