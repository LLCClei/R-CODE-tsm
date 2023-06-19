rm(list=ls(all=TRUE))
library(tseries)

adf.test(nhtemp)
adf.test(nhtemp, alternative = "explosive")

