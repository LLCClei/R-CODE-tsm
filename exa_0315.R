x <- scan("yarn.data"); x <- ts(x, start = 1964)

win.graph(width=10, height=4)
library(astsa)
acf2(diff(x),  max.lag=10)

savePlot("yarn_acf2", type="eps")

arima(x, order = c(1,1,1))

