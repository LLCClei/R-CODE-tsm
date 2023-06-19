win.graph(width=10, height=3.5)
par(mai=c(0.9, 0.9, 0.2, 0.2))

x <- scan("yarn.data"); x
x <- ts(x, start = 1964)
t <- 1964:1999
lm.sol <- lm(x~1+t)
plot(x, xlab='时间 / 年', ylab='纱产量 / 万吨', lwd = 2)
abline(lm.sol, lty=5, col=4, lwd = 2)
legend(1965, 550,  
   col = c(1, 4), lty = c(1, 5), lwd = 2, 
   legend=c("观测值", "长期趋势")) 

plot(diff(x), xlab='时间 / 年', ylab='一阶差分', lwd = 2)

savePlot("yarn_b", type="bmp")

