#set working directory
setwd("C:/Users/luna/Google Drive/Spring_19/compbio/CompBioLabsAndHomework/labs/lab07")

#lab 07 - problem 1
#write a user-defined function named "triangleArea" that calculates and returns the area of a triangle
triangleArea <- function(base, height) {
    0.5 * base * height
}
#demonstrate that the function works by calling it for an imaginary triangle that has a base of 10 units and a height of 9 units
triangleArea(10, 9)

#lab 07 - problem 2
#without usings the abs() function, create a user-defined function named "myAbs" that calculates and returns absolute values for any object / value, "x"
myAbs <- function(x) {
    #run a for loop that will run across the length of a vector
    for (i in 1:length(x)) {
    #utilize the conditional, "if", to specify that if the i'th index position within "x" (x[i]) is less than zero, then replace the value in this position with that value multiplied by -1
    if(x[i] < 0) {
        x[i] <- x[i] * -1
    }
    }
    #return function specification needed in this function so that the value of "x" is returned
    return(x)
}
#lab 07 - problem 2.1 - demonstrate that the function works by calling it with the number 5
myAbs(5)
#lab 07 - problem 2.2 - demonstrate that the function works by calling it with the number -2.3
myAbs(-2.3)
#lab 07 - problem 2.3 - demonstrate that the function works by calling it with the vector c(1.1, 2, 0, -4.3, 9, -12)
absVec <- c(1.1, 2, 0, -4.3, 9, -12)
myAbs(absVec)

#lab 07 - problem 3
#write a function that returns a vector 
#n = the number of values in the "fibVec" function
fibVec <- function(n, s) {
    #create a vector, called "fib", consisting of 0's repeating "n" times
    fib <- rep(0, n)
    #make the second index position equal 1 in the "fibSeq" vector
    fib[2] <- 1
    #the first number in fib is denoted as "s" which will have to be either 0 or 1
    fib[1] <- s
    for(x in 3:length(fib)) {
        fib[x] <- fib[x-2] + fib[x-1]
    }
    #returns the vector, "fib", containing "n"
    return(fib)
}
#demonstrate that the function "fibVec" works by specifying how many numbers you want, "n", as 20 and whether or not the first index position of the vector, "fib", is 0 or 1
fibVec(20, 1)

#lab 07 - problem 4
#lab 07 - problem 4a - write a function that takes two numbers as its arguments and returns the square of the difference between them
sqDiff <- function(x, y) {
    (x - y) ^ 2
}
    #lab 07 - problem 4a.1 - demonstrate that your function works by calling it with the numbers 3 and 5
sqDiff(3, 5)
    #lab 07 - problem 4a.2a - call "squareDiff" where the first argument is the vector c(2, 4, 6) and the second argument is the number 4, begin by creating a vector named, "sqDiffVec"
sqDiffVec <- c(2, 4, 6)
    #lab 07 - problem 4a.2b - run "sqDiff" function with the first argument "sqDiffVec"
sqDiff(sqDiffVec, 4)
#lab 07 - problem 4b - write a function that calculates the mean of a vector of numbers
meanFunc <- function(x) {
    (sum(x)) / length(x)
}
    #lab 07 - problem 4b.1 - demonstrate the function works by calling it with the vector, named "meanVec", c(5, 15, 10)
meanVec <- c(5, 15, 10)    
meanFunc(meanVec)
    #lab 07 - problem 4b.2 - demonstrate the function works by calling it with the data found in "DataForLab07.csv"
    #import data set and name it "data"
data <- read.csv("DataForLab07.csv")
    #create a vector named "dataVec" by indexing the values listed in column 1 of the vector "data"
dataVec <- data[,1]
    #run function with the vector "dataVec" to demonstrate the function "meanFunc" works
meanFunc(dataVec)
#lab 07 - problem 4c - create a function that calculates the sum of squares
TSS <- function(x) {
    #calculate the mean for entire vector
    TSS_mean <- meanFunc(x)
    #create a variable of some numeric value that will be used to store the calculated value of the sum of all of the squares to be used/replaced in the loop 
    TSS_sum <- 0
    #run a for loop across the length of some object, "x". Replace the value of "TSS_sum" with adding the previous value of "TSS_sum" to the "sqDiff" function. The arguments, x and y, in the "sqDiff" function needs to be specified as: x = the i'th value of the object "x", y = the mean of the entire vector, "TSS_mean". 
    for (i in 1:length(x)) {
    TSS_sum <- TSS_sum + (sqDiff(x[i], TSS_mean))
    }
    #return the new value of "TSS_sum"
    return(TSS_sum)
}
#demonstrate the function works with the vector created in 4b.2, "dataVec". 
TSS(dataVec)