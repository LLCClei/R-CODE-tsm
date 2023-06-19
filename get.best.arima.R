get.best.arima <- function(x.ts, minord = rep(0, 6), maxord = rep(1,6)){
    best.bic <- 1e8
    n <- length(x.ts)
    for (p in minord[1]:maxord[1]) for(d in minord[2]:maxord[2]) 
      for(q in minord[3]:maxord[3]) for (P in minord[4]:maxord[4]) 
        for(D in minord[5]:maxord[5]) for(Q in minord[6]:maxord[6]){
              fit <- arima(x.ts, order = c(p,d,q),
                   seas = list(order = c(P,D,Q), frequency(x.ts)), 
                    method = "CSS-ML")
          fit.bic <- -2 * fit$loglik + (length(fit$coef) + 1) * log(n)
          if (fit.bic < best.bic){
              best.bic <- fit.bic; best.fit <- fit
              best.model <- c(p,d,q,P,D,Q)
          }
    }
    list(best.bic, best.fit, best.model)
}