win.graph(width=10, height=2.5)
par(mai=c(0.8, 0.8, 0.1, 0.1))

x <- 0:20
y <- ARMAacf(ar = c(rep(0,3), 0.8), lag = 20); y
plot(x, y, type = "n", xlab = "延迟数", ylab = "自相关函数")

points(x, y, pch = 19)
abline(h = 0)
segments(x, rep(0, length(x)), x, y)

x <- 1:20
y <- ARMAacf(ar = c(rep(0,3), 0.8), lag = 20, pacf = TRUE); y
plot(x, y, type = "n", xlab = "延迟数", ylab = "偏自相关函数")

savePlot("SAR1_pacf", type="bmp")
