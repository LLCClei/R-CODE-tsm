x.arima <- arima(AirPassengers, order=c(0,1,1), 
     seasonal = list(order = c(1, 1, 1), period = 12))
x.arima
tsdiag(x.arima)

x.pre <- predict(x.arima, n.ahead = 2*12)

win.graph(width=10, height=5)
par(mai=c(0.9, 0.9, 0.6, 0.1))
plot(AirPassengers, xlim=c(1959, 1963), ylim=c(300, 800), 
     xlab='时间 / 年', ylab = '乘客人数 / 千人', 
     main = '航空乘客人数及预测 （AirPassengers）')
lines(x.pre$pred, lty=4, col=2, lwd=2)
lines(x.pre$pred - 2*x.pre$se, lty=5, col=4)
lines(x.pre$pred + 2*x.pre$se, lty=5, col=4)
legend(1959, 800, col=c(1, 2, 4), lty=c(1, 4, 5),
       legend = c("真实值", "预测值", "95% 的预测区间")) 

savePlot("AirPassengers_pred", type="bmp")

