library(astsa)
library(tseries)
library(xts)
source("..\\chap02\\t_test.R")
source("get.best.arima.R")

win.graph(width=10, height=4.5)
par(mai=c(0.7, 0.9, 0.5, 0.1))

djiar <- 100*diff(log(djia$Close))[-1]
plot(djiar, ylab="ÊÕÒæÂÊ / %")

savePlot("djia_1", type="bmp")

acf2(djiar)
#acf2(djiar^2)

get.best.arima(djiar, maxord = c(3,0,3,0,0,0))

(djiar.arma <- arima(djiar, order=c(2,0,3), include.mean = F))
AIC(djiar.arma)
BIC(djiar.arma)
t_test(djiar.arma)

res <- djiar.arma$residuals
acf2(res)

win.graph(width=10, height=3.5)
par(mai=c(0.9, 0.9, 0.7, 0.1))
acf(res^2)
savePlot("djia_2", type="eps")

(djiar.garch <- garch(res, order=c(0,6)))
summary(djiar.garch)
plot(djiar.garch)


