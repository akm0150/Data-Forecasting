####################### LIBRARIES USED IN PROJECT############################################
library(alphavantager) #for extracting data through api
library(zoo)           #irregular time series of numeric vectors/matrices and factors
library(xts)           #Extensible time series class and methods
library(forecast)      #Methods and tools for displaying and analysing univariate time series forecasts including exponential smoothing via state space models and automatic ARIMA modelling.
library(lubridate)     #functions to work with date-times and time-spans: fast and user friendly parsing of date-time data, extraction and updating of components of a date-time (use of as.date() )
library(ggplot2)       #for plotting
library(TTR)           #Functions and data to construct technical trading rules with R.(for calculating moving averages)
library(tseries)       #Time series analysis and computational finance(adf test)
library(caret)         #Misc functions for training and plotting classification and regression models.

####################### DATA FETCH USING ALPHAVANTAGE API ###################################

# Set API Key (Do this once)
av_api_key("YGFW8H5RH7BBN813")

## TO GET STOCK OF DIFFERENT COMPANY CHANGE SYMBOL VALUE IN STOCK_DATA COMMAND AND KINDLY CHANGE THE YEARS ACCORDING TO DATA IN PLOT COMMAND

# Get Stock Data for last 18 years
stock_data<-av_get(symbol ="MSFT" , av_fun = "TIME_SERIES_DAILY", interval = "60min",outputsize="full")
View(stock_data)
###################### DATA PREPROCESSING OR CONVERTING THE DATA TO TIME SERIES #############

stocks <- xts(stock_data[,-1], order.by=as.Date(stock_data$timestamp, "%m/%d/%Y")) #converting dataframe data to time series data

stock_monthly<-to.monthly(stocks$close, name="stk") #aggregating the data monthly

time_series_stk = ts(stock_monthly,start = c(1995,1),frequency = 12) # converting aggregated data to time series 

stock_close<-time_series_stk[,4] #selecting only close values

###################### PLOT THE DATA ########################################################
x1="MICROSOFT"
plot(stock_close, xlab='Years', ylab = 'Stock_Close',main= c(x1,"STOCK CLOSE PRICE IN LAST 20 YEARS"), type="l", lwd=2, col="red",xlim=c(1995,2019),axes=F)
axis(1,at=1995:2020,labels=1995:2020);axis(2);box()

##################### CLEANING DATA #########################################################
#cleandata
close_clean_data<-tsclean(stock_close)
close_log_data=log(close_clean_data)

#plotting clean data
plot(close_clean_data, xlab='Years', ylab = 'stock_Close',main=main= c(x1,"CLEANED STOCK_CLOSE DATA"), type="l", lwd=2, col="red",xlim=c(1995,2019),axes=F)
axis(1,at=1995:2020,labels=1995:2020);axis(2);box()

#################### PREREQUISITE OF ARIMA MODELLING ########################################
#AUGMENTED DICKER FULLER TEST
adf.test(close_clean_data, alternative="stationary")
ns <- ndiffs(close_clean_data)
stationary_data <- diff(close_clean_data,differences=ns)
adf.test(stationary_data, alternative="stationary")

#plotting time series data
plot(stationary_data, xlab='Years', ylab = 'Stock_Close', type="l", lwd=2, col="red",xlim=c(1995,2019),axes=F)
axis(1,at=1995:2020,labels=1995:2020);axis(2);box()

#DETERMINIG ORDER OF ARIMA
Acf(stationary_data, main='')
Pacf(stationary_data, main='')




