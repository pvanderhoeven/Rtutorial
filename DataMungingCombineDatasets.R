sport <- c("Motorsport", "Voetbal", "Tennis")
league <- c("Formule1", "Eredivisie", "ATP")
trophy <- c("World Champion", "Dutch Champion", "Grand Slam")

sports1 <- cbind(sport,league,trophy)
sports1

sports2 <- data.frame(sport=c("Basketball", "Golf"),
                      league=c("NBA", "PGA"),
                      trophy=c("Larry O'Brian Championchip Trophy", "Wannamaker Trophy"))
sports2

#bind data
sports <- rbind(sports1, sports2)
sports

# cbind for vector or matrix, stacks horizonaly
# rbind to stack vertically 