#lab 08 - step 3
#lab 08 - step 3a (lab 04 - step 4)
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

#(lab 04 - step 7)
#redo question 4 and plot the results
#rerun line 37 - 47
#create time vector from 1 to 12
t <- 1:12
#plot time (t) and abundance (n) 
plot(t, n)
#plot will show population abundance as it reaches carrying capacity

#lab 08 - step 3b
#Turn the logistic growth model code into a function that takes r (the intrinsic growth rate), K (the carrying capacity), the total number of generations, and the initial population size as its arguments
logGrowthModel <- function(r, K, intPop) {
    t <- 1:12
    n <- rep(intPop, 12)
    for (t in 2:12) {
        n[t] <- n [t-1] + (r * n [t-1] * (K - n [t-1])/K )
    }
    return(n)
}
#run the function, "logisticGrowthModel" to demonstrate that it works
logGrowthModel(0.8, 10000, 2500)

#lab 08 - step 3c
#add code that produces a plot of the data it generates
logGrowthModel <- function(r, K, totalGens, intPop) {
    n <- rep(intPop, totalGens)
    for (t in 2:totalGens) {
        n[t] <- n [t-1] + (r * n [t-1] * (K - n [t-1])/K )
    }
    times <- 1:totalGens
    plot(times, n)
    return(n)
}

#lab 08 - step 3d
#demonstrate that the function works by calling it with my own parameter values
logGrowthModel(0.8, 10000, 12, 2500)

#lab 08 - step 3e
#create a matrix of the results from the logistic growth model called "myResults" by adding code to the function
logGrowthModel <- function(r, K, totalGens, intPop) {
    n <- rep(intPop, totalGens)
    for (t in 2:totalGens) {
        n[t] <- n [t-1] + (r * n [t-1] * (K - n [t-1])/K )
    }
    times <- 1:totalGens
    plot(times, n)
    myResults <- cbind(times, n)
    colnames(myResults) <- c("generations", "abundance")
    return(myResults)
}
#demonstrate that the function works with 
myResults <- logGrowthModel(0.8, 10000, 12, 2500)
#write code that writes the data set to a file
write.csv(x = myResults, file = "example_logistic_growth_model.csv")