#% 模拟生成ARCH(2)过程
set.seed(12356)
a0 <- 0.1; a <- c(0.5, 0.2)  
v <- rnorm(1100); e <- double(1100)
e[1:2] <- rnorm(2, sd = sqrt(a0/(1.0-a[1]-a[2]))) 
for(t in 3:1100){
    e[t] <- v[t]*sqrt(a0 + a[1]*e[t-1]^2 + a[2]*e[t-2]^2)
}
e.arch <- ts(e[101:1100])

win.graph(width=10, height=3.5)
par(mai=c(0.9, 0.9, 0.1, 0.1))

plot(e.arch)
acf(e.arch)
acf(e.arch^2)

library(tseries)
arch.sol <- garch(e.arch, order = c(0,2))
summary(arch.sol)
plot(arch.sol)

#% 模拟生成GARCH(1,1)过程
set.seed(12356)
a0 <- 0.1; a <- 0.5; b <- 0.2  
v <- rnorm(1100); e <- double(1100)
h <- a0/(1.0-a-b)
for(t in 2:1100){
    h <- a0 + a*e[t-1]^2 + b*h
    e[t] <- v[t]*sqrt(h)
}
e.garch <- ts(e[101:1100])

plot(e.garch)

garch.sol <- garch(e.garch)
summary(garch.sol)
plot(garch.sol)

win.graph(width=10, height=10)
savePlot("plot", type="eps")


