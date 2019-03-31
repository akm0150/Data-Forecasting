fit_seasonal<-auto.arima(close_clean_data, max.p = 10, max.q = 10, max.P = 10,max.Q = 10, max.order = 10, max.d = 10, max.D = 10) #using auto arima function arima model is created
tsdisplay(residuals(fit_seasonal), lag.max=45, main='Model Residuals' ) #plotting residuals
seas_fcast2 <- forecast(fit_seasonal, h=32) # forecasting seasonalized data
#plotting forecasted data
plot(seas_fcast2, xlab='Years', ylab = 'Msft_Close', type="l", lwd=2, col="red",xlim=c(1995,2029),ylim=c(0,300),axes=F)
axis(1,at=1995:2023,labels=1995:2023);axis(2);box()

