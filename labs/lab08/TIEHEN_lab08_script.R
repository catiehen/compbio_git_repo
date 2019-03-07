#step 4
#write a for loop for discrete-time logistic growth given the intrinsic growth rate (r), carrying capacity (K), population at time "t" (n[t])
#create a variable for carrying capacity called "K"
K <- 10000
#create a variable for the intrinsic growth rate called "r"
r <- 0.8
#create a variable for time called "t"
t <- 1
#create a vector for "n" repeating 2500 (the population at t = 1), 12 times
n <- rep(2500,12)
#predict the population abundance over the next twelve years, create variable "n[t]" to loop equation twelve times and store the data of the population abundance at time "t"
for (t in 2:12) {
    n[t] <- n [t-1] + (r * n [t-1] * (K - n [t-1])/K )
}
#print "n" to console to examine the population abundance at time step 12
print(n)

#step 7
#redo question 4 and plot the results
#rerun line 37 - 47
#create time vector from 1 to 12
t <- 1:12
#plot time (t) and abundance (n) 
plot(t, n)
#plot will show population abundance as it reaches carrying capacity