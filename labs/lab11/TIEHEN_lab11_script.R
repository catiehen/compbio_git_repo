#set-up
setwd("C:/Users/luna/Google Drive/Spring_19/compbio/CompBioLabsAndHomework/labs/lab11")
library("tidyverse")
library("ggplot2")
library("dplyr")

#part I
#lab 11 - step 3: import .csv into R and call it "woodData"
woodData <- read.csv("GlobalWoodDensityData.csv", stringsAsFactors = F)

#part II
#lab 11 - step 4a: locate the only row that has no density data entered (marked as NA)
which(is.na(woodData$Wood.density))
    #row number = 12150
#lab 11 - step 4b: remove the row that contains the missing data
woodData <- woodData[-c(12150),]

#lab 11 - step 5: create a new data frame that has each species listed only once, has the family and binomial information for each species, and has the mean of the density measurements for each species
spFaBiWoodData <- summarise(group_by(woodData, Family, Binomial), meanDiff = mean(Wood.density))
    #examine new data frame for accuracy
View(spFaBiWoodData)

#lab 11 - step 6: determine which families of trees have the greatest and least densities
#lab 11 - step 6a: Make a new data frame that has the average density for each Family (and no longer has individual species)
faBiWoodData <- summarise(group_by(woodData, Family), meanDiff = mean(Wood.density))
    #examine new data frame for accuracy
View(faBiWoodData)
#lab 11 - step 6b: Sort the result of problem 6a by MeanDensity (and store the sorted result in a data frame)
sortedWoodData <- arrange(faBiWoodData, desc(meanDiff))
    #examine new data frame for accuracy
View(sortedWoodData)
#lab 11 - step 6c: Using your results from problem 6b... 
    #What are the 8 families with the highest average densities? 
head(sortedWoodData, n = 8)
        #Answer: Hypericaceae, Zygophyllaceae, Irvingiaceae, Sarcolaenaceae, Surianaceae, Linaceae, Bonnetiaceae, Quiinaceae
    #What are the 8 families with the lowest average densities?
tail(sortedWoodData, n = 8)
        #Answer: Tetramelaceae, Datiscaceae, Muntingiaceae, Bixaceae, Hernandiaceae, Moringaceae, Paulowniaceae, Caricaceae

#part III
#lab 11 - step 7: Plotting densities of most and least dense families with facets. The goal of this part is to make two figures using ggplot combined with the results of multiple previous problems. 
    #lab 11 - step 7 - plot 1: Densities of individual species from the families with the highest average densities
        #create a variable using the data found in the first part of step 6c
firstEight <- head(sortedWoodData, n = 8)
        #subset the data
keepCol <- (spFaBiWoodData$Family %in% firstEight$Family)
speciesData <- spFaBiWoodData[keepCol,]
        #plot the top eight families on separate boxplots
ggplot(speciesData, aes(Family, meanDiff)) + geom_boxplot() + facet_wrap(facets = ~Family, scale = "free")
    #lab 11 - step 7 - plot 2: Densities of individual species from the families with the lowest average densities
        #create a variable using the data found in the second part of step 6c
lastEight <- tail(sortedWoodData, n = 8)
        #subset the data
keepCol2 <- (spFaBiWoodData$Family %in% lastEight$Family)
speciesData2 <- spFaBiWoodData[keepCol2,]
        #plot the last eight families on separate boxplots
ggplot(speciesData2, aes(Family, meanDiff)) + geom_boxplot() + facet_wrap(facets = ~Family, scale = "free")

#lab 11 - step 8: create a plot similar to that in Sam's lab 11 assignment (plots are easier to compare the data)
    #did not get to, pushing anyways, may update later