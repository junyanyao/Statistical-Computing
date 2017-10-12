##Read the data
household<- read.table(file="Desktop/VLSSperCapita.csv", header=TRUE, sep=",", row.names="ID")
head(household)
tail(household)
str(household)
summary(household)

#plot the density for expenditures
plot(density(household$Dollars, xlab="U.S. Dallars", main=" "))

#using different bw
par(mfrow=c(2,3))
plot(density(household$Dollars, xlab="U.S. Dallars", main=" ", bw=0.1))
plot(density(household$Dollars, xlab="U.S. Dallars", main=" ", bw=0.2))
plot(density(household$Dollars, xlab="U.S. Dallars", main=" ", bw=0.5))
plot(density(household$Dollars, xlab="U.S. Dallars", main=" ", bw=1))
plot(density(household$Dollars, xlab="U.S. Dallars", main=" ", bw=10))
plot(density(household$Dollars, xlab="U.S. Dallars", main=" ", bw=100))

#alternative method

bw<- c(0.1,0.2,0.5,1,10,100)

plotD<- function (i){
  
  plot(density(household$Dollars, xlab="U.S. Dallars", main=" ", bw=i))
}

par(mfrow=c(2,3))

for (i in bw){
  plotD(i)
}




#The overall shape did not change. The bigger the bw, the smoother the density plot shows. 
#The plot only has one peak, no evidence to show multimodel.



