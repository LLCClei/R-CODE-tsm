set.seed(123456)
Phi <- c(0, 0, 0, 0.8)
sAR <- arima.sim(list(order = c(4,0,0), ar = Phi), n = 100)
sAR <- ts(sAR, freq = 4)
plot(sAR)

win.graph(width=10, height=2.5)
par(mai=c(0.9, 0.9, 0.1, 0.1))

acf(sAR, lag = 20)
pacf(sAR, lag = 20)

savePlot("sAR1_pacf", type="eps")
