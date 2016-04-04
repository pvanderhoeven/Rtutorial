codes <- read.table("data/countryCodes.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
head(codes)
countries <- read.table("data/GovType.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
head(countries)
View(countries, head(5))

countryMerged <- merge(x=codes, y=countries, by.x = "Country.name", by.y = "Country")
View(countryMerged)

# better use join from plyr package than merge. Merge is slower

require(plyr)
# the colums have to have the same name
codes <- rename(codes, country.name = "Country")
countryJoined <- join(x=codes, y=counties, by="Country")
