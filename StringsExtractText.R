require(XML)
theURL <- "http://www.loc.gov/rr/print/list/057_chron.html"
# it's the 3rd table (check source code), skip the first row
presidents <- readHTMLTable(theURL, which = 3, skip.rows = 1, header = TRUE, stringAsFactors=FALSE)
head(presidents)
tail(presidents)
tail(presidents$YEAR)
presidents <- presidents[1:64, ]
tail(presidents$YEAR)

require(stringr)
#split years in begin and end year 
yearList <- str_split(string = presidents$YEAR, pattern = "-")
head(yearList)
yearMatrix <- data.frame(Reduce(rbind, yearList))
head(yearMatrix)
names(yearMatrix) <- c("Start", "Stop")
head(yearMatrix)

presidents <- cbind(presidents, yearMatrix)
head(presidents)
tail(presidents)

# first 3 characters of the presidents names
str_sub(string = presidents$PRESIDENT, start = 1, end = 3)
# other examples
str_sub(string = presidents$PRESIDENT, start = 4, end = 8)

# search for year, ending with 1
presidents[str_sub(presidents$Start, start = 4, end = 4) == 1, 
           c("YEAR", "PRESIDENT", "Start", "Stop")]

str_detect(presidents$PRESIDENT, ignore.case("john"))
View(presidents[str_detect(presidents$PRESIDENT, ignore.case("john")), ])

#reg ex
# url function because we load a rdata file
con <- url("http://jaredlander.com/data/warTimes.rdata")
load(con)
close(con)
head(con)
head(warTimes, 10)

#
warTimes[str_detect(string=warTimes, pattern = "-")]
theTimes <- str_split(string = warTimes, pattern = "(ACAEA)|-", n=2)
head(theTimes)

theStart <- sapply(theTimes, FUN = function(x) x[1])
head(theStart)

# remove tailing spaces
theStart <- str_trim(theStart)
head(theStart)

str_extract(string = theStart, pattern = "January")

# subset the vectors where january was detected
theStart[str_detect(string = theStart, pattern = "January")]


#search for years
head(str_extract(string=theStart, pattern = "[0-9]{4}"), 20)
head(str_extract(string=theStart, pattern = "\\d{4}"), 20)

head(str_extract(string=theStart, pattern = "\\d{1,3}"), 20)

# $ => end of line, so ^ and $ mean only the reg ex on a line
head(str_extract(theStart, pattern = "^\\d{4}$"), 20)

# substitude text
# str_replace only replace the first match. str_replace_all replaces all
head(str_replace(theStart, pattern = "\\d", replacement = "x"), 30)
head(str_replace_all(theStart, pattern = "\\d", replacement = "x"), 30)


head(str_replace_all(theStart, pattern = "\\d{1,4}", replacement = "x"), 30)


commands <- c("<a href=index.html>The link is here</a>",
              "<b>This is bolt text</b>")
commands

# extract text between the ancors
# . => search for any character, + => multiple characters, ? => be lazy (check 1 line at a time)
# () search for text
# \\1 replace with the text found
str_replace(string=commands, pattern = "<.+?>(.+?)<.+>", replacement = "\\1")
