set.seed(123456)
alpha0 <- 0.1; alpha1 <- 0.4; beta1 <- 0.2
n <- 10000; epsilon <- numeric(n)
v <- rnorm(n); h <- numeric(n)
h[1] <- alpha0/(1-alpha1-beta1)
for (t in 2:n) {
    h[t] <- alpha0 + alpha1*(epsilon[t-1]^2) + beta1*h[t-1]
    epsilon[t] <- v[t] * sqrt(h[t])	
}

acf(epsilon)
acf(epsilon^2)


library(TSA)
set.seed(123456)
epsilon <- garch.sim(alpha=c(0.1, 0.4), beta = 0.2, n=10000)


