win.graph(width=10, height=3.5)
par(mai=c(0.9, 0.9, 0.6, 0.1))
acf(nottem, lag.max = 10*12)
savePlot("nottem_acf", type="eps")

plot(diff(nottem, lag = 12), ylab = 'Differences (lag = 12)', 
      main = 'Series nottem')
savePlot("nottem_diff", type="eps")

arima(nottem, order = c(1,0,0), 
      seasonal = list(order = c(1, 1, 1), period = 12))
