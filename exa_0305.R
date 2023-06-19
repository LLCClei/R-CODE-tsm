library(TSA); data(oil.price)
y <- log(oil.price)
t <- seq(from=1986+1/12, to=2006+1/12, by=1/12)
lm.sol <- lm(y~1+t)
summary(lm.sol)

win.graph(width=10, height=3.5)
par(mai=c(0.9, 0.9, 0.2, 0.1))
plot(y, xlab='ʱ��', ylab='ʯ�ͼ۸�Ķ���ֵ')
abline(lm.sol, lty=5, col=4)

plot(diff(y), xlab='ʱ��', ylab='������һ�ײ��')

savePlot("oil_price_log_b", type="bmp")




acf(diff(y), lag=12*5)
pacf(diff(y),lag=12*5)

arima(y, order=c(0,1,1))