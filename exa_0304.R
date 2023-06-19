win.graph(width=10, height=3.5)
par(mai=c(0.9, 0.9, 0.2, 0.2))

diff1 <- diff(AirPassengers)
plot(diff1, xlab = '时间', ylab = '一阶差分')

diff12 <- diff(diff1, lag = 12)
plot(diff12, xlab = '时间', ylab = '季节差分（二阶）')

savePlot("AirPassengers_diff_b", type="bmp")
