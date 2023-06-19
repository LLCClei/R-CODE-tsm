rm(list=ls(all=TRUE))
library(tseries)

pp.test(nhtemp)
pp.test(nhtemp, alternative = "explosive")

