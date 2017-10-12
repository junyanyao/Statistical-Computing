############APSTA GE 2352 Homework 1#########
#######Junyan Yao (N19596716)###############

library(datasets)
airquality

#####Question a
plot(density(airquality$Wind))
# The plot looks like normal distribution with mean at around 10; seems a little bit positive skewed;

####Question b
newset <- subset(airquality, airquality$Month==6)
plot(density(newset$Solar.R))
 
####Question c
septset <- subset(airquality,airquality$Month==9)
plot(density(septset$Solar.R))

#compare and contrast two plots (Green line is for June; Red line is for September)
plot(density(septset$Solar.R), col="red")
par(new=TRUE)
plot(density(newset$Solar.R), col="green") 
#June and September data for Solar have different shapes. Overall, they are like normal distribution, they both have two pikes, but June's pikes are more centered. 

####Question d
  mean(airquality$Ozone)
  mean(airquality$Solar.R)
#both return to NA, which means they cannot be calculated
    
####Question e
mean(airquality$Ozone,na.rm=TRUE)
mean(airquality$Solar.R,na.rm=TRUE)
#using na.rm is to drop the missing value when calculating mean**

    