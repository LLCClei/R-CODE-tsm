rm(list=ls(all=TRUE))
library(tseries)

kpss.test(nhtemp)
kpss.test(nhtemp, null = "Trend")

