##HW 3##
#Junyan Yao#
################3.2##########################
#draw randon selected value
set.seed(100)
x<-rnorm(n=50,mean =0, sd=1)

#a
plot(density(x,bw=0.5))

#b
plot(density(x,bw=0.5, kernel="triangular"))
plot(density(x,bw=0.5, kernel="rectangular"))
plot(density(x,bw=0.5, kernel="epanechnikov"))
plot(density(x,bw=0.5, kernel="biweight"))

#c
#similarities: the general shapes are almost same,bell-shaped;
#difference: with different kernel options, the curve has different smoothing degree; 
#the rectangular kernel line is very not smoothing; Biweight kernel line is relatively smoothing caompared with others;

###################3.3###################
#a
set.seed(100)
y<-rnorm(n=100, mean=0,sd=1)

install.packages("sm")
library("sm")

plot(sm.density(y))

#b
plot(sm.density(y,model="Normal"))

#c
#no evidence shows the genrated data are non-normal, the curve looks like a normal distribution.
#and it falls into the reference band


#d
z<- rchisq(n=100, df=3)
plot(z)
plot(sm.density(z,model="Normal"))

#the overall shape looks like bell-shaped but not symmetric. Some parts are not in the reference band. so it may not be normal distributed.