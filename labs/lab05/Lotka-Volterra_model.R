#Lotka-Volterra model
#set up parameter values
#create an object for 1000 total generations
totalGenerations <- 1000
#create an object for initial prey abundance at time t = 1 
initPrey <- 100
#create an object for initial predator abundance at time t = 1 
initPred <- 10
#create an object for the attack rate
a <- 0.01
#create an object for the growth rate of prey
r <- 0.2
#create an object for the mortality rate of predators
m <- 0.05
#create an object for the conversion constant of prey into predator biomass
k <- 0.1

#part II - step 2
#create a "time" vector 
times <- 1:totalGenerations
#make two additional vectors to store results, one for the values of "n" over time and the other to store the values of "p"
n <- rep(initPrey, totalGenerations)
p <- rep(initPred, totalGenerations)

#part II - step 3 
#write a for loop that implements the Lotka-Volterra model
for (t in 2:totalGenerations) {
    n[t] <- n[t-1] + (r * n[t-1]) - (a * n[t-1] * p[t-1])
    p[t] <- p[t-1] + (k * a * n[t-1] * p[t-1]) - (m * p[t-1])
}

#part II - step 4
#view the object "n" to examine the predator abundance over time for the totalGenerations (1000)
View(n)
#view the object "p" to examine the predator abundance over time for the totalGenerations (1000)
View(p)
#add 'if' statement(s) to the for loop that will change any negative numbers in "n" and "p" to zero
for (t in 2:totalGenerations) {
    n[t] <- n[t-1] + (r * n[t-1]) - (a * n[t-1] * p[t-1])
    p[t] <- p[t-1] + (k * a * n[t-1] * p[t-1]) - (m * p[t-1])
    if (n[t] < 0) {
        n[t] = 0
    }
    if (p[t] < 0) {
        p[t] = 0
    }
}
#view "n" and "p" to confirm that 'if' statements were successful 
View(n)
View(p)

#part II - step 5
#plot the abundances of prey and predators over time using the plot() and lines() function
plot(times, n)
lines(times, p)

#part II - step 6
#create a matrix of the results from the pred-prey model called "myResults"
myResults <- cbind(times, n, p)
#specify column names
colnames(myResults) <- c("TimeStep", "PreyAbundance", "PredAbundance")
#view the matrix "myResults" to confirm that all of the information and column names have been included
View(myResults)
#write this matrix to a csv in the current working directory (Lab05)
write.csv(x = myResults, file = "PredPreyResults.csv")