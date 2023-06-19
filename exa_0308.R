set.seed(123456)
Phi <- c(0, 0, 0, 0.7)
Theta <- c(0, 0, 0, 0.9)
sARMA <- arima.sim(list(order = c(4,0,4), ar = Phi, ma = Theta), n = 100)
sARMA <- ts(sARMA, freq = 4)
plot(sARMA)

win.graph(width=10, height=2.5)
par(mai=c(0.9, 0.9, 0.1, 0.1))

acf(sARMA, lag = 20)
pacf(sARMA, lag = 20)

savePlot("sARMA1_pacf", type="eps")
