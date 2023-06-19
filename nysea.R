library(astsa)
library(tseries)
source("..\\chap02\\t_test.R")
source("get.best.arima.R")

plot(nyse, ylab="NYSE Returns")
acf2(nyse)
#acf2(nyse^2)

nyse.arma <- arima(nyse, order=c(0,0,1), include.mean = F); nyse.arma
BIC(nyse.arma)
t_test(nyse.arma)

res <- nyse.arma$residuals
acf(res)
acf(res^2)

nyse.garch <- garch(res, order=c(0,3)); nyse.garch
summary(nyse.garch)
plot(nyse.garch)



get.best.arima(nyse, maxord = c(3,0,3,0,0,0))

