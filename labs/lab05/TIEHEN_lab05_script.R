#part I - simple conditionals

#part I - step 1
#create an object named "x" and assign the value 6 
x <- 6
#run an if-else statement cheking if the value is greater than 5
if (x > 5) {
    "YAY"
} else {
    "NAH"
}

#part I - step 2
#obtain the file "Vector1.csv" from Sam's git repo by using git bash
    #code in git bash ... 
        #git pull
        #cd "Google Drive"/Spring_19/compbio/compbioSandbox/CompBio_on_git/Labs/Lab05/
        #cp Vector1.csv ~/"Google Drive"/Spring_19/compbio/CompBioLabsAndHomework/labs/lab05/
#set working directory to local/git directory lab05
setwd("C:/Users/luna/Google Drive/Spring_19/compbio/CompBioLabsAndHomework/labs/lab05")
#create a new object "vector1_data" which will contain the .csv file "Vector1.csv"
vector1_data <- read.csv("Vector1.csv")

#part I - step 2a
#view csv file to examine the information contained in the .csv file
View(vector1_data)
#create a vector that contains the values from the x column of "vector1_data"
x <- vector1_data$x
#use a for loop to replace every negative value in "x" with NA
for (i in 1:length(x)) {
    if (x[i] < 0) {
    x[i] <- NA
         }
}
#view data frame "x" to ensure that the values were replaced
View(x)

#part I - step 2b
#use logical indexing to replace the index positions containing NA with NaN
x[is.na(x)] <- NaN
#view data "x" to ensure that the values of NA are replaced with "NA"
View(x)

#part I - step 2c
#use the which function to replace the index positions containing NaN with 0
x[which(is.nan(x))] <- 0
#view data "x" to ensure that the values of NAN are replaced with 0
View(x)

#part I - step 2d
#use the length and which function to create a new vecor called "xFiftyToOneHundred" to determine how many of the values from the .csv fall in the range of 50-100
xFiftyToOneHundred <- length(which(x > 50 & x < 100))
#print value to console
print(xFiftyToOneHundred)

#part I - step 2e
#create a vector called "FiftyToOneHundred" that contains all of the values from "x" that are between 50 & 100
FiftyToOneHundred <- which(x > 50 & x < 100)
#view the values in "FiftyToOneHundred" by indexing "x"
View(x[FiftyToOneHundred])

#part I - step 2f
#save the vector "FiftyToOneHundred" into my own directory "Lab05"
write.csv(x = FiftyToOneHundred, file = "FiftyToOneHundred.csv")

#part I - step 3 
#import the csv file "CO2_data_cut_paste.csv" 
co2_emiss <- read.csv("CO2_data_cut_paste.csv")
#view the text file "MetaData_CO2_emissions.txt" to learn what the data in "CO2_data_cut_paste.csv" represents
file.show("MetaData_CO2_emissions.txt")

#part I - step 3a
#utilize the .csv file "CO2_data_cut_paste.csv" and "MetaData_CO2_emissions.txt" to answer the question: what was the first year for which data on "Gas" emissions were non-zero?
#view the imported data in "co2_emiss" to examine the data
View(co2_emiss)
#utilize the which function to determine where the non-zero values begin and end in the column "Gas" in the data "co2_emiss", create an object from this called "gas_rows"
gas_rows <- which(co2_emiss$Gas > 0)
#print "gas_rows" to console, this will show all the row numbers that contain non-zero values in the "Gas" column
print(gas_rows)
#index "gas_rows" to show the first value in the vector which will be the first column where non-zero values begin in the "Gas" column
gas_rows[1]
#in the data "co2_emiss", specifiy to look in the "Year" column and index the row within the data "gas_rows" to show the first year in which gas emissions were non-zero
co2_emiss$Year[gas_rows[1]]

#part I - step 3b
#utilize the .csv file "CO2_data_cut_paste.csv" and "MetaData_CO2_emissions.txt" to answer the question: during which years were "Total" emissions between 200 and 300 million?
#view the imported data in "co2_emiss" to examine the data 
View(co2_emiss)
#utilize the which function to determine where the values in the column "Total" (in the data "co2_emiss") are between 200 and 300, create an pbject from this called "carbon_rows"
carbon_rows <- which(co2_emiss$Total > 200 & co2_emiss$Total < 300)
#print "carbon_rows" to console, this will show all the row numbers that contain values in between 200 and 300 in the "Total" column
print(carbon_rows)
#in the data "co2_emiss", specifiy to look in the "Total" column and index the rows within the data "carbon_rows"
co2_emiss$Total[carbon_rows[1:9]]

#part II - Lotka-Volterra (predator-prey model) - write code that calculates abundances of predators and prey over time according to this model

#part II - info
#abundance of prey at time t: n[t] <- n[t-1] + (r * n[t-1]) - (a * n[t-1] * p[t-1])
    #prey exponential growth: (r * n[t-1])
        #r = intrinsic growth rate
    #prey abundance decrease due to predator consumption: ((a * n[t-1] * p[t-1]))
        #a = attack rate of predators on prey
#abundance of predators at time t: p[t] <- p[t-1] + (k * a * n[t-1] * p[t-1]) - (m * p[t-1])
    #predator abundance increase due to consuption of prey: (k * a * n[t-1] * p[t-1])
        #k = conversion constant representing the conversion of consumed prey into biomass of predators
    #predator death / constant mortality rate: (m * p[t-1])
        #m = intrinsic mortality rate

#part II - step 1
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
times <- c(1:totalGenerations)
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

#git add, commit, push when complete