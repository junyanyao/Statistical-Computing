########Project #2##########
#######JUNYAN YAO########
######APSTA 2352###########

###################################################
### Power & AUC.  See http://gim.unmc.edu/dxtests/roc3.htm for some technical details.
###################################################

#write a function to compute the True Positive Rate (TPR) of a 2 sample t-test; allow for different sample sizes and effect sizes.

#you must fill in the ______

#defintions:
#TPR: true positive rate: P(detect an effect | there is an effect)
#FPR: false positive rate: P(detect an effect | there is NO effect)

simTPR <- function(N,nSims=2500,eff.size=0.1,alpha=0.05) {
  
  #returns a simulation based TPR for a two sample t-test with one population having a mean eff.size units larger than the other.  Assumes normal, sd=1 populations.
  #N:         number of obs in each sample
  #nSims:     number of simulation trials (to compute TPR)
  #eff.size:  effect size in SD units, assuming obs are from 2 std normals, centered at 0, eff.size, respectively.
  #alpha:    the FPR, as in alpha level of the test.
  
  
  p.val <- rep(0, nSims)  #set up a vector of length nSims to store p.val result from t.test
  for (i in 1:nSims) { #in each iteration, draw two samples, x1 with mean zero, x2 with mean = eff.size; both with sd=1
    x1 <- rnorm(n=N,mean=0,sd=1)
    x2 <- rnorm(n=N, mean=eff.size,sd=1)
    tt.result <- t.test(x1,x2)
    p.val[i] <- tt.result$p.value
    
  }
  return(mean(p.val< alpha))
}

#simulation set up:

set.seed(10001)
nSims <- 2500
eff.size <- 0.1
N <- 500
alphas <- seq(0,1,length=101)  #test each of these
tprs <- rep(NA,length(alphas))  #vector of corresponding TPRs to each alpha

#set up for plot:
plot(0,0,xlab='false pos rate',ylab='true pos rate',type='n',ylim=c(0,1),xlim=c(0,1))

for (i in seq_along(alphas)) {
  tprs[i] <- simTPR(N=N,nSims=nSims,eff.size=eff.size,alpha=alphas[i]) #evaluate a TPR given an alpha
}
lines(alphas,tprs,lty=1)


#NOW:

#MODIFY the above to run through ALL of these Ns and PLOT separate lines for each
N <- c(100,500,2500)  #
nSims <- 2500
eff.size <- 0.1
color<-c(1,2,3)
alphas <- seq(0,1,length=101)  #test each of these
tprs <- rep(NA,length(alphas))  #vector of corresponding TPRs to each alpha

#set up for plot:
plot(0,0,xlab='false pos rate',ylab='true pos rate',type='n',ylim=c(0,1),xlim=c(0,1))


for (j in 1:3) {
  for (i in seq_along(alphas)) {
    tprs[i] <- simTPR(N=N[j],nSims=nSims,eff.size=eff.size,alpha=alphas[i]) #evaluate a TPR given an alpha
  }
  lines(alphas,tprs,lty=1, col=color[j])
  legend("topright",legend = c("n=100","n=500","n=2500"),col=c(1,2,3))
}




#NEXT:
#add text to plot to identify each line with its 'n', as in n=100, n=500, etc.

#if you complete the above well, you can get 90 pts.

#FOR THE LAST 10 points:

#write a function AUC for area under the curve, given the curves you just produced.


AUC <- function(alphas,tprs){
  rectangle <- rep(0,(length(tprs)-1))
  for (i in 1:(length(tprs)-1) ){
    rectangle[i] <- diff(alphas)*(tprs[i]+tprs[i+1])/2
  }
  return(sum(rectangle))
}



