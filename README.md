# Data-Forecasting
Project on stock data forecasting using ARMA model
A project which use ARMA prediction model for stock price prediction  
=========

#Steps to implement the project:

1. I use alpha vantage for fetching real time stock data. I have provided the api key but you can also get your own key at                    https://www.alphavantage.co/                                                        
2. Install missing packages - e.g.    install.packages("forecast")
3. Run (Data fetching and preprocessing.R) for Fetching data and preprocessing 
4. TO GET STOCK OF DIFFERENT COMPANY CHANGE SYMBOL VALUE IN STOCK_DATA COMMAND AND KINDLY CHANGE THE YEARS ACCORDING TO DATA IN PLOT      
   COMMAND
5. Run forecast.R to make the forecasting model
6. Run "plot between predicted and actual.R" to plot graph between actual and predicted value

Valuable Imformation :- "There exist a number of such criteria for comparing quality of fit across multiple models. Two of the most widely used are Akaike information criteria (AIC) and Baysian information criteria (BIC). These criteria are closely related and can be interpreted as an estimate of how much information would be lost if a given model is chosen. When comparing models, one wants to minimize AIC and BIC."

Disclaimer: The code for this project was built for the "Machine Learning and Applications" course at CDAC MOHALI in 2018 and was not intended for publication - however, you can use this script as a starting point to built your own project, but please go over the code for obvious improvements and cleanups first.

Please share your finished project with me via akm.anujmehta0011@gmail.com - or not, it's up to you!

License: MIT
