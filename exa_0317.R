arima(AirPassengers, order = c(0,1,1), 
      seasonal = list(order = c(1, 1, 1), period = 12))

