set.seed(123456)
Theta <- c(0, 0, 0, -0.8)
sMA <- arima.sim(list(order = c(0,0,4), ma = Theta), n = 100)
sMA <- ts(sMA, freq = 4)
plot(sMA)

win.graph(width=10, height=2.5)
par(mai=c(0.9, 0.9, 0.1, 0.1))

acf(sMA, lag = 20)
pacf(sMA, lag = 20)

savePlot("sMA1_pacf", type="eps")
