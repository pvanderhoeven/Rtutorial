paste("hello", "Peter", "and others")
paste("hello", "Peter", "and others", sep = "/")

paste(c("hello", "Hey", "Howdy"), c("Peter", "Mel", "Wende"))
paste("hello",c("Peter", "Mel", "Wende"))
paste("hello",c("Peter", "Mel", "Wende"), c("Goodbye", "Seeya"))

vectorOfText <- c("hello", "everyone", "out there", ".")
vectorOfText
paste(vectorOfText, collapse = " ")

person <- "Peter"
partySize <- 8
waitTime <- 25

paste("Hello ", person, ", your party of ", partySize, " will be seated in ",
      waitTime, " minutes", sep = "")

# sprintf 
sprintf("Hello %s, your party of %s will be seated in %s minutes", person, partySize, waitTime)
