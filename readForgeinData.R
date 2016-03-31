require(foreign)

# read SPSS data
read.spss()

# read stata data
read.dta

# read sas data. requires sas license
read.ssd

# read octave data
read.octave

#read minitab
read.mtp

# read systat
read.systat()

# read matlab data. Documentation: https://cran.r-project.org/web/packages/R.matlab/R.matlab.pdf
require(R.matlab)
# of 
library(R.matlab)
data <- readMat("filepath")

