rm(list=ls(all=TRUE))
library(tseries)

adf.test(airmiles)
adf.test(airmiles, alternative = "explosive")

