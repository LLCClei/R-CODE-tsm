win.graph(width=10, height=3.5)
par(mai=c(0.9, 0.9, 0.6, 0.1))
acf(nottem, lag.max = 10*12)  #分析数据的平稳性，是否含有季节周期
savePlot("nottem_acf", type="eps")

plot(diff(nottem, lag = 12), ylab = 'Differences (lag = 12)',  
     main = 'Series nottem')  
savePlot("nottem_diff", type="eps")

arima(nottem, order = c(1,0,0), 
      seasonal = list(order = c(1, 1, 1), period = 12))

win.graph(width=10, height=6)
par(mai=c(0.9, 0.9, 0.6, 0.1))

nottem.arima <- arima(nottem, order=c(1,0,0), 
    seasonal = list(order = c(1, 1, 1), period = 12))
nottem.arima
tsdiag(nottem.arima)

nottem.pre <- predict(nottem.arima, n.ahead = 5*12); nottem.pre
plot(nottem, xlab='year', ylab='temperature', lwd = 1, 
     xlim=c(1935, 1945), ylim=c(34, 69), 
     main = 'Monthly average and forecast monthly temperatures for Nottingham Castle')
lines(nottem.pre$pred, lty=4, lwd=2, col=2)
lines(nottem.pre$pred - 2*nottem.pre$se, lty=5, col=4)
lines(nottem.pre$pred + 2*nottem.pre$se, lty=5, col=4)
legend(1936, 69, col=c(1, 2, 4), lty=c(1, 4, 5), 
       legend = c("real value","predict valye","95%PI"))

savePlot("nottem_pre", type="bmp")

