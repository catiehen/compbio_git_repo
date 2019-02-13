#part 1

#step 1
#write a for loop that that prints the word "hi" to the console 10 times
for (i in seq(1,10)) {
    print("hi")
}

#step 2 
#write a for loop that prints to the console his total amount of money each week for the next 8 weeks
#create variables for original amount, allowance and gum
current <- 10
allow <- 5
gum <- 1.34 * 2 

#for loop: replace the current value with the current value in savings per week for 8 weeks, print value to console
for (i in seq(1,8)) {
    current <- (current) + (allow - gum)
    print(current)
}

#step 3
#what is the expected population size each year for the next seven years
#create variables for original population size and percent decline
k <- 2000
rate <- 0.05

#for loop: replace k with the current population value per year for the next seven years, print values to console
for (i in seq(1,7)) {
    k <- (k - (k * rate))
    print(k)
}

#step 4
#write a for loop for discrete-time logistic growth given the intrinsic growth rate (r), carrying capacity (K), population at time t (n[t])
#create variables for K, r and the initial time of t
K <- 10000
r <- 0.8
t <- 1
#create a vector for n repeating 12 times
n <- rep(2500,12)

#predict the population abundance over the next twelve years, replace n with n[t] to loop equation twelve times
for (t in 2:12) {
   n[t] <- n [t-1] + (r * n [t-1] * (K - n [t-1])/K )
}
#print n to console
print(n)

#part 2

#step 5 
#step 5a
#create a vector contatining eighteen zeros
zeros <- rep(0,18)
#print vector to console to confirm it was accurately created
print(zeros)

#step 5b
#create a for loop, iterated eighteen times, that will store three times the i'th value of the iterator variable i in the i'th spot of the vector created in step 5a
three <- 3 
#replace the values in zeros to show 3 times the i'th value
for (i in seq(1,18)) {
    zeros[i] <- three * i
} 
#print zeros to console
print(zeros)

#step 5c
#repeat part a to make a new vector of zeros
zeros <- rep(0,18)
#index the first value of the vector zeros to equal 1
zeros[1] <- 1
#print the vector zeros to the screen
print(zeros)
#check length of the vector
length(zeros)

#step 5d
#begin at index 2 in the zeros vector and tell for loop to run across the length of the vector. using the values stored in that vector, replace these values with 1 + 2 * the previous entry.
for (i in 2:length(zeros)) {
    zeros[i] <- 1 + (2 * zeros[i-1])
}
#print zeros to console
print(zeros)

#step 6
#create a vector for the first 20 numbers of the fib sequence
fib <- rep(0,20)
#second position needs to be 1 for the fib sequence
fib[2] <- 1
#run a for loop beginning at the index 3 that will use the values in index 2 and 1 (added together) to replace the values throughout the 18 indexes
for (x in 3:length(fib)) {
    fib[x] <- fib[x-2] + fib[x-1]
}
#print fib to console 
print(fib)

#step 7
#redo question 4 and plot the results
#rerun line 37 - 47
#create time vector from 1 to 12
t <- 1:12
#plot time (t) and abundance (n) 
plot(t, n)
#plot will show population abundance as it reaches carrying capacity
