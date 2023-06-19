t <- 1937:1960 
lm.sol <- lm(airmiles ~ 1 + t + I(t^2))
b <- lm.sol$coefficients 
summary(lm.sol)

win.graph(width=10, height=3.5)
par(mai=c(0.9, 0.9, 0.2, 0.2))

plot(airmiles, lwd=2, xlab='时间 / 年', ylab='乘客英里数',)
yy<-b[1]+b[2]*t+b[3]*t^2

lines(t, yy, lty=5, lwd=2, col=4)
legend(1937, 30000,  
   col = c(1, 4), lty = c(1, 5), lwd = 2, 
   legend=c("观测值", "长期趋势（二次曲线）")) 

plot(diff(airmiles, diff = 2), xlab='时间 / 年', ylab='二阶差分', lwd = 2)

savePlot("airmiles_diff_b", type="bmp")