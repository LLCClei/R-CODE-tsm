rm(list=ls(all=TRUE))
library(tseries)

pp.test(airmiles)
pp.test(airmiles, alternative = "explosive")

