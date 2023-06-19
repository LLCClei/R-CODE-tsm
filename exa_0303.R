win.graph(width=10, height=3.5)
par(mai=c(0.9, 0.9, 0.3, 0.1))

library(TSA); data(tempdub)
plot(tempdub, xlab = '年份', ylab = '气温 / F', type = 'l')
Months <- c(1:9, "O", "N", "D")
points(y = tempdub, x = time(tempdub), pch = Months )

diff_s <- diff(tempdub, lag = 12)
plot(diff_s, xlab = '年份', ylab = '季节差分', type = 'l')

savePlot("tempdub_diff", type = "bmp")


acf(diff(tempdub, lag = 12), lag = 5*12)

