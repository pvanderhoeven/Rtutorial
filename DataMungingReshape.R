require(reshape2)
head(airquality)

# melting = changing from wide format to long format
airMelt <- melt(airquality, id=c("Month", "Day"), value.name = "Value", variable.name = "metric")
head(airMelt, 10)

dim(airquality)
dim(airmelt)

#dcast is oposite of melt
airCast <- dcast(airMelt, Month + Day ~ metric, value.var = "Value")
head(airCast)

# change order of columns
airCast <-  airCast[, c("Ozone", "Solar.R", "Wind", "Temp", "Month", "Day")]
head(airCast)

