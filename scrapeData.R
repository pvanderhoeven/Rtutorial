require(XML)
theURL <- "http://www.jaredlander.com/2012/02/another-kind-of-super-bowl-pool/"

# pull data
bowlGame <- readHTMLTable(theURL, which = 1, header=FALSE, stringsAsFactors=FALSE)
bowlGame

