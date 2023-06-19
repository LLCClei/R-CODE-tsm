win.graph(width=10, height=3.5)
par(mai=c(0.9, 0.9, 0.2, 0.2))

x <- scan("yarn.data"); x
x <- ts(x, start = 1964)
t <- 1964:1999
lm.sol <- lm(x~1+t)
plot(x, xlab='ʱ�� / ��', ylab='ɴ���� / ���', lwd = 2)
abline(lm.sol, lty=5, col=4, lwd = 2)
legend(1965, 550,  
   col = c(1, 4), lty = c(1, 5), lwd = 2, 
   legend=c("�۲�ֵ", "��������")) 

plot(diff(x), xlab='ʱ�� / ��', ylab='һ�ײ��', lwd = 2)

savePlot("yarn_b", type="bmp")
