require(RODBC)
db <- odbcConnect("dsn")
db
ordersTable <- sqlQuery(db, "SELECT * FROM orders", stringsAsFactors=FALSE)
head(ordersTable)
detailsTable <- sqlQuery(db, "SELECT * FROM [Orders Details]", stringsAsFactors=FALSE)
head(detailsTable)

longQuery <- "SELECT * FROM Orders, [Order Details] WHERE Orders.OrderID = [Order Details].OrderID"
joinedTable <- sqlQuery(db, longQuery, stringsAsFactors=FALSE)
head(joinedTable)