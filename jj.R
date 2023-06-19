library(astsa)
plot(log(jj))

lm.sol <- lm(log(jj)~1+time(jj))
abline(lm.sol)

diff1 <- diff(log(jj), differences = 1)
plot(diff1)

diff14 <- diff(diff1, lag = 4, differences = 1)
plot(diff14)

acf(diff14)

diff(x, lag = 1, differences = 1)

arima(log(jj), order=c(0,1,1), 
    seasonal = list(order = c(1, 1, 0), period = 4))

get.best.arima(log(jj), maxord = rep(1,6))
