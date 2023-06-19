rm(list=ls(all=TRUE))
library(tseries)

kpss.test(AirPassengers)
kpss.test(AirPassengers, null = "Trend")

