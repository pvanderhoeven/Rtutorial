ifelse(1 == 1, "Yes", "No")
ifelse(1 == 0, "Yes", "No")

toTest <- c(1,1,0,1,0,1)
ifelse(toTest == 1, "Yes", "No")

ifelse(toTest == 1, toTest*3, toTest)

# All return as characters
ifelse(toTest == 1, toTest*3, "Zero")

# change 2nd element to NA
toTest[2] <- NA
# important. NA will stay the same, so not replace with "Zero"
ifelse(toTest == 1, toTest*3, "Zero")
