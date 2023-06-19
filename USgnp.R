library(astsa)
library(tseries)

source("C:\\XueYi\\CCT\\Time_series_with_R\\R\\chap03\\get.best.arima.R")
source("C:\\XueYi\\CCT\\Time_series_with_R\\R\\chap02\\t_test.R")

u <- diff(log(gnp))*100
plot(u)
acf(u)
pacf(u)
u.arma <- arima(u, order=c(1,0,0)); u.arma
t_test(u.arma)


res <- u.arma$residuals
acf(res, lag=4*12)
acf(res^2, lag=4*12)

McLeod.Li.test(arima(u, order=c(1,0,0)), y=u)

u.garch <- garch(res, order=c(0,1)); u.garch
summary(u.garch)
plot(u.garch)



get.best.arima(u, maxord = c(3,0,3,0,0,0))