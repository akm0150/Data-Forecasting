fit_seasonal<-auto.arima(close_clean_data) #using auto arima function arima model is created
tsdisplay(residuals(fit_seasonal), lag.max=45, main='Model Residuals' ) #plotting residuals
seas_fcast2 <- forecast(fit_seasonal, h=16) # forecasting seasonalized data
#plotting forecasted data
plot(seas_fcast2, xlab='Years', ylab = 'Msft_Close', type="l", lwd=2, col="red",xlim=c(1995,2029),ylim=c(0,200),axes=F)
axis(1,at=1995:2020,labels=1995:2020);axis(2);box()

