win.graph(width=10, height=3.5)
par(mai=c(0.9, 0.9, 0.2, 0.2))

diff1 <- diff(AirPassengers)
plot(diff1, xlab = 'ʱ��', ylab = 'һ�ײ��')

diff12 <- diff(diff1, lag = 12)
plot(diff12, xlab = 'ʱ��', ylab = '���ڲ�֣����ף�')

savePlot("AirPassengers_diff_b", type="bmp")