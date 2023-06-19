##1
plot(Nile)
t <- as.vector(time(Nile))
lm.sol <- lm(Nile~t+I(t^2))
summary(lm.sol)
adf.test(Nile)

a <- lm.sol$coefficients
yy <- a[1] + a[2]*t + a[3]*t^2 
lines(t, yy)

plot(diff(Nile, differences = 1))

arima(Nile, order=c(0,1,1))

## 2 
plot(ldeaths)
plot(diff(ldeaths, lag=12))


## 3
plot(co2)
t <- as.vector(time(co2))
lm.sol <- lm(co2~1+t)
abline(lm.sol)

plot(diff(co2, diff=1))
plot(diff(diff(co2, diff=1),lag=12))

## 4
library(astsa)
plot(jj)

t <- as.vector(time(jj))
lm.sol <- lm(jj~1+t+I(t^2))
summary(lm.sol)

a <- lm.sol$coefficients
yy <- a[1] + a[2]*t + a[3]*t^2
lines(t, yy)

plot(diff(jj,diff=2))
plot(diff(diff(jj,lag=12), diff=2))

log_jj <- log(jj)
plot(log_jj)
plot(diff(log_jj))
plot(diff(diff(log_jj,lag=12)))


## 6
ima22 <- arima.sim(model = list(order = c(0,2,2), ma = c(-1, 0.6)), 
         n = 100)
plot(ima22)

## 7
ARMAtoMA(ar = c(1.8, -0.8), lag.max=5)

ar <- 0.8; lag <- 5
ma <- numeric(0); S <- 1
for( i in 1:lag){
    S <- S + ar^i
    ma[i] <- S
}
ma

## 9
ma <- c(.5, rep(0,10), 0.8, 0.4)
ma.sim <- arima.sim(model = list(order = c(0,0,13), ma = ma), 
         n = 200)
acf(ma.sim)

## 10
ar <- c(rep(0, 11), 0.75); ma <- 0.4
arma.sim <- arima.sim(model = list(order = c(12,0,1), ar = ar, ma = ma), 
         n = 200)
acf(arma.sim)
pacf(arma.sim)

## 11
adf.test(Nile)
adf.test(Nile, alternative = "explosive")

pp.test(Nile)

kpss.test(Nile)
kpss.test(Nile, null = "Trend")

## 12
ldeaths.diff <- diff(ldeaths, lag=12) 
adf.test(ldeaths.diff)
pp.test(ldeaths.diff)
kpss.test(ldeaths.diff)

## 13
Nile.diff <- diff(Nile, diff = 1)
library(astsa)
acf2(Nile.diff)
Nile.arima <- arima(Nile, order=c(0,1,1)); Nile.arima
t_test(Nile.arima)
tsdiag(Nile.arima)

## 14 
acf(ldeaths)
ldeaths.diff <- diff(ldeaths, lag=12) 
acf2(ldeaths.diff)

ldeaths.arima <- arima(ldeaths, order=c(1,0,1), 
      seasonal = list(order = c(2, 1, 1), period = 12)
); ldeaths.arima
t_test(ldeaths.arima)
tsdiag(ldeaths.arima)

## 15
co2.diff <- diff(diff(co2, diff = 1),lag = 12)
adf.test(co2.diff)
acf2(co2.diff)

co2.arima <- arima(co2, order = c(0, 1, 1), 
      seasonal = list(order = c(0, 1, 1), period = 12)
); co2.arima
t_test(co2.arima)
tsdiag(co2.arima)

## 16
Nile.pre <- predict(Nile.arima, n.ahead = 10); Nile.pre	
plot(Nile, lwd = 1, xlim=c(1940, 1980), ylim=c(400, 1200))
lines(Nile.pre$pred, lty=4, lwd=2, col=2)	
lines(Nile.pre$pred - 2*Nile.pre$se, lty=5, col=4)
lines(Nile.pre$pred + 2*Nile.pre$se, lty=5, col=4)
legend(1940, 1400, c("真实数据", "预测数据", "95% 置信区间"), 
       col=c(1, 2, 4), lty=c(1, 4, 5), lwd=c(1, 2, 1)) 

## 17
ldeaths.pre <- predict(ldeaths.arima, n.ahead = 12*2); ldeaths.pre
plot(ldeaths, lwd = 1, xlim=c(1976, 1982), ylim=c(850, 3900))
lines(ldeaths.pre$pred, lty=4, lwd=2, col=2)
lines(ldeaths.pre$pred - 2*ldeaths.pre$se, lty=5, col=4)
lines(ldeaths.pre$pred + 2*ldeaths.pre$se, lty=5, col=4)
abline(v=1979+11/12, lty=2)
legend(1976.5, 3900, c("真实数据", "预测数据", "95% 置信区间"), 
       col=c(1, 2, 4), lty=c(1, 4, 5), lwd=c(1, 2, 1)) 

## 18
co2.pre <- predict(co2.arima, n.ahead = 12*7); co2.pre
plot(co2, lwd = 1, xlim=c(1985, 2005), ylim=c(340, 383))
lines(co2.pre$pred, lty=4, lwd=2, col=2)
lines(co2.pre$pred - 2*co2.pre$se, lty=5, col=4)
lines(co2.pre$pred + 2*co2.pre$se, lty=5, col=4)
abline(v=1997+11/12, lty=2)
legend(1985, 380, c("真实数据", "预测数据", "95% 置信区间"), 
       col=c(1, 2, 4), lty=c(1, 4, 5), lwd=c(1, 2, 1)) 

## 19
log_jj <- log(jj)
jj.diff <- diff(diff(log_jj,lag=12))
acf2(jj.diff)

jj.arima <- arima(log_jj, order = c(0, 1, 1), 
      seasonal = list(order = c(1, 1, 0), period = 4)
); jj.arima
t_test(jj.arima)
tsdiag(jj.arima)

jj.pre <- predict(jj.arima, n.ahead = 4*5); jj.pre
plot(jj, lwd = 1, xlim=c(1975, 1986), ylim=c(5, 33))
lines(exp(jj.pre$pred), lty=4, lwd=2, col=2)
#lines(exp(jj.pre$pred - 2*jj.pre$se), lty=5, col=4)
#lines(exp(jj.pre$pred + 2*jj.pre$se), lty=5, col=4)

## 20
plot(nyse, ylab="NYSE Returns")
acf2(nyse)

nyse.arma <- arima(nyse, order=c(0,0,1), include.mean = F); nyse.arma
BIC(nyse.arma)
t_test(nyse.arma)
tsdiag(nyse.arma)

res <- nyse.arma$residuals
acf(res)
acf(res^2)

nyse.garch <- garch(res, order=c(0,3)); nyse.garch
summary(nyse.garch)
plot(nyse.garch)


