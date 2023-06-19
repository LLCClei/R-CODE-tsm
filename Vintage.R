rc <- read.csv("Vintage.csv"); rc
Vintage <- ts(data = c(rc[,2], rc[,3], rc[,4]), 
    start = 1, frequency = 12)

win.graph(width=10, height=3.5)
par(mai=c(0.9, 0.9, 0.1, 0.1))

plot(Vintage, xlab = "时间 / 年", ylab = "销售量 / 千美元")

savePlot("Vintage_4", type = "eps")

Vintage.diff <- diff(diff(Vintage, lag = 12))
plot(Vintage.diff, xlab = "时间 / 年", ylab = "普通和季节差分")

library(astsa)
win.graph(width=10, height=5)
acf2(Vintage.diff, max.lag=12)

source("get.best.arima.R")
get.best.arima(Vintage, minord = c(0, 1, 0, 0, 1, 0), 
    maxord = c(1, 1, 2, 1, 1, 1) )

Vintage.arima <- arima(Vintage, order = c(0, 1, 1), 
    seasonal = list(order = c(0, 1, 0), period = 12))
Vintage.arima

t_test(Vintage.arima)

tsdiag(Vintage.arima)
predict(Vintage.arima, n.ahead = 12)

acf(resid(Vintage.arima))


