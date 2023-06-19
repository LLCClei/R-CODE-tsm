win.graph(width=10, height=2.5)
par(mai=c(0.8, 0.8, 0.1, 0.1))

x <- 0:25
y <- ARMAacf(ma = c(0.5, rep(0, 10), 0.8, 0.4),  
             lag = 25); y
plot(x, y, type = "n", xlab = "延迟数", ylab = "自相关函数")

points(x, y, pch = 19)
abline(h = 0)
segments(x, rep(0, length(x)), x, y)

savePlot("SARMA_d", type="bmp")


x <- 1:25
y <- ARMAacf(ma = c(0.5, rep(0, 10), 0.8, 0.4),  
             lag = 25, pacf = T); y
plot(x, y, type = "n", xlab = "延迟数", ylab = "偏自相关函数")

points(x, y, pch = 19)
abline(h = 0)
segments(x, rep(0, length(x)), x, y)

##--------------------------------------------------##
x <- 0:40
y <- ARMAacf(ar = c(rep(0, 11), 0.75), ma = 0.4,  
             lag = 40); y
plot(x, y, type = "n", xlab = "延迟数", ylab = "自相关函数")

points(x, y, pch = 19)
abline(h = 0)
segments(x, rep(0, length(x)), x, y)

x <- 1:40
y <- ARMAacf(ar = c(rep(0, 11), 0.75), ma = 0.4,  
             lag = 40, pacf = T); y
plot(x, y, type = "n", xlab = "延迟数", ylab = "偏自相关函数")

points(x, y, pch = 19)
abline(h = 0)
segments(x, rep(0, length(x)), x, y)


