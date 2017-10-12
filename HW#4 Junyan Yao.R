##Read the data
household<- read.table(file="Desktop/VLSSperCapita.csv", header=TRUE, sep=",", row.names="ID")
head(household)
tail(household)
str(household)
summary(household)

#plot the density for expenditures
plot(density(household$Dollars. xlab="U.S. Dallars", main=" "))

#using sm.density plot
library("sm")
par(mfrow=c(2,2))
sm.density(household$Dollars, bw=0.1)
sm.density(household$Dollars, bw=0.2)
sm.density(household$Dollars, bw=0.5)
sm.density(household$Dollars, bw=1)

#The overall shape did not change. The overall did not see any changes