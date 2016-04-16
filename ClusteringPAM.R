# PAM = Partitioning Around Medoids
wine <- read.table("data/wine.csv", header = TRUE, sep = ",")
require(cluster)
winePam <- pam(x=wineTrain, k=4, keep.diss = TRUE, keep.data = TRUE)
winePam
plot(winePam, which.plots=2, main="")
