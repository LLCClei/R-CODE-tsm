Carlson <- scan("Carlson.data")
Carlson <- ts(Carlson, start = c(1996,9), frequency = 12); Carlson

win.graph(width=10, height=3.5)
par(mai=c(0.9, 0.9, 0.2, 0.2))
plot(Carlson, xlab = "ʱ��", ylab = "�����۶�")
savePlot("Carlson_14", type="eps")

Carlson.diff <- diff(diff(Carlson, lag=12))
plot(Carlson.diff, xlab = "ʱ��", ylab = "��ͨ��ֺͼ��ڲ��")

library(astsa)
win.graph(width=10, height=5)
acf2(Carlson.diff, max.lag=2*12, main = "��ͨ��ֺͼ��ڲ�ֺ������")

Carlson.arima <- arima(Carlson, order=c(0, 1, 1), 
   seasonal = list(order = c(1, 1, 0), period = 12))
Carlson.arima
t_test(Carlson.arima)

win.graph(width=10, height=8)
tsdiag(Carlson.arima)

Carlson.pre <- predict(Carlson.arima, n.ahead = 4); Carlson.pre
plot(Carlson, xlim=c(1997, 2001))
lines(Carlson.pre$pred, lty=4, col=2)
lines(Carlson.pre$pred-2*Carlson.pre$se, lty=5, col=4)
lines(Carlson.pre$pred+2*Carlson.pre$se, lty=5, col=4)

#######################################################
z <- scan("Carlson_2.data")
Carlson2 <- ts(z[1:48], start = c(1996,9), frequency = 12); Carlson2
Carlson3 <- ts(z[49:52], start = c(2000,9), frequency = 12); Carlson3

Carlson2.diff <- diff(diff(Carlson2, lag=12))
plot(Carlson2.diff)

get.best.arima(Carlson2, minord = c(0, 1, 0, 0, 1, 0), 
     maxord = c(1, 1, 1, 1, 1, 1) )
Carlson2.arima <- arima(Carlson2, order=c(0, 1, 1), 
     seasonal = list(order = c(0, 1, 0), period = 12))
Carlson2.arima

Carlson2.pre <- predict(Carlson2.arima, n.ahead = 4); Carlson2.pre$pred
plot(Carlson2, xlim=c(1997, 2001), ylim=c(44, 122))
lines(Carlson3, col=2)
lines(Carlson2.pre$pred, lty=4, col=4)
lines(Carlson2.pre$pred-2*Carlson2.pre$se, lty=5, col=5)
lines(Carlson2.pre$pred+2*Carlson2.pre$se, lty=5, col=5)

win.graph(width=10, height=4.0)
par(mai=c(0.9, 0.9, 0.2, 0.1))
plot(Carlson3, col=2, ylim=c(43,122), lwd=2, 
     xlab='ʱ�� / ��', ylab = '�����۶� / ������Ԫ') 
#     main = '�����ӻ��̵�������۶Ԥ�����۶�')
lines(Carlson2.pre$pred, lty=4, col=4, lwd=2)
lines(Carlson2.pre$pred-2*Carlson2.pre$se, lty=5, col=5, lwd=2)
lines(Carlson2.pre$pred+2*Carlson2.pre$se, lty=5, col=5, lwd=2)
legend(2000.68, 120, legend=c('ʵ������', 'Ԥ��ֵ', '��������'), 
      lty=c(1, 4, 5), col=c(2, 4, 5), lwd=c(2, 2, 2))

savePlot("Carlson_2", type="bmp")

