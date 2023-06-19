data(usd.hkd)
rate <- ts(usd.hkd$hkrate, freq=1)
rate <- ts(usd.hkd$r, freq=1)
plot(rate, xlab="日", ylab="收益率")

arma.sol <- arima(rate, order=c(1,0,1)); arma.sol
t_test(arma.sol)

acf(arma.sol$residuals)
acf(arma.sol$residuals^2)

garch.sol <- garch(arma.sol$residuals, order=c(0,1))
summary(garch.sol)
plot(garch.sol)

get.best.arima(rate, maxord = c(3,0,3,0,0,0))


arma.sol <- arima(rate, order=c(1,0,0))
garch.sol <- garch(rate, order=c(0,2))
