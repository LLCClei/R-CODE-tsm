library(MASS); data(SP500)
SP500 <- ts(SP500)
win.graph(width=10, height=4)
par(mai=c(0.9, 0.9, 0.2, 0.1))
plot(SP500, type = 'l')

savePlot("SP500", type="eps")

arima(SP500, order = c(1,0,1))

win.graph(width=10, height=3)
par(mai=c(0.9, 0.9, 0.2, 0.1))

acf(SP500)
acf(SP500^2)

savePlot("SP500sqrt_acf", type="eps")

library(tseries)
SP500.garch <- garch(SP500, order = c(1,1))
summary(SP500.garch)
plot(SP500.garch)

get.best.arima(SP500, maxord = c(2,0,2,0,0,0))

