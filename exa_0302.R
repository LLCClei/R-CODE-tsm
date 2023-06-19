t <- 1937:1960 
lm.sol <- lm(airmiles ~ 1 + t + I(t^2))
b <- lm.sol$coefficients 
summary(lm.sol)

win.graph(width=10, height=3.5)
par(mai=c(0.9, 0.9, 0.2, 0.2))

plot(airmiles, lwd=2, xlab='ʱ�� / ��', ylab='�˿�Ӣ����',)
yy<-b[1]+b[2]*t+b[3]*t^2

lines(t, yy, lty=5, lwd=2, col=4)
legend(1937, 30000,  
   col = c(1, 4), lty = c(1, 5), lwd = 2, 
   legend=c("�۲�ֵ", "�������ƣ��������ߣ�")) 

plot(diff(airmiles, diff = 2), xlab='ʱ�� / ��', ylab='���ײ��', lwd = 2)

savePlot("airmiles_diff_b", type="bmp")