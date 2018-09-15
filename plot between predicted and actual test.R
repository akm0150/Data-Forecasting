df<-cbind(seas_fcast2[["fitted"]],close_clean_data)
df<-as.data.frame(df)
colnames(df)<-c("predicted","actual")


df1<-cbind(df$predicted,df$actual)
df1<-as.data.frame(df1)
colnames(df1)<-c("predicted","actual")
df1$predicted = ts(df1$predicted,start = c(1995,1),frequency = 12)
df1$actual = ts(df1$actual,start = c(1995,1),frequency = 12)


plot(df1$predicted,type="l",xlab="values",ylab="stock_price",main=c("Comparison between predicted and actual stock price of ",x1),col="blue",xlim=c(1995,2019),axes=F)
legend(2006,80, legend=c("actual", "predicted"),col=c("red", "blue"), lty=1:2, cex=0.8)

axis(1,at=1995:2020,labels=1995:2020);axis(2);box()

lines(df1$actual,type="l",col="red")

