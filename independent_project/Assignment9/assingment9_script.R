#part I - data set up
#step 1 - set working directory
setwd("C:/Users/luna/Google Drive/Spring_19/compbio/CompBioLabsAndHomework/independent_project/Assignment9")
#step 2 - convert .txt data files to .csv files 
    #read .txt files into three lists
txt1 <- read.delim("rawData-M.txt", header = TRUE)
txt2 <- read.delim("pcaAnalysisData.txt", header = TRUE)
txt3 <- read.delim("louisvilleData-M.txt", header = TRUE)
    #convert lists to .csv files to be created in current working directory
write.table(txt1, file = "rawData-M.csv", sep = ",", col.names = TRUE, row.names = FALSE)
write.table(txt2, file = "pcaAnalysisData.csv", sep = ",", col.names = TRUE, row.names = FALSE)
write.table(txt3, file = "louisvilleData-M.csv", sep = ",", col.names = TRUE, row.names = FALSE)
#step 3 - read in .csv files as objects named "rawData", "pcaAnalysisData", and "louisvilleData"
rawData <- read.csv("rawData-M.csv")
pcaAnalysisData <- read.csv("pcaAnalysisData.csv")
louisvilleData <- read.csv("louisvilleData-M.csv")
#step 4 - examine newly created objects
View(rawData)
View(pcaAnalysisData)
View(louisvilleData)
#step 5 - merge data from "rawData" and "louisvilleData" to create the new object "chemotypes"
merge <- list.files(pattern = "-M.csv")
chemotypes <- do.call("rbind", lapply(merge, read.csv, header = TRUE))
    #examine "chemotypes" to ensure the file merging was successful - 3154 rows total should be seen, including the header row
View(chemotypes)

#step 6 - create a list called "chemo.active" without the origin data
chemo.active <- pcaAnalysisData[, 2:7]

#step 7 - create a vector called "cannaorigin" containing only the origin data
cannaorigin <- pcaAnalysisData[, 1]

#step 8 - call in all packages associated with analyses to be ran
library("dplyr")
library("doBy")
library("tidyverse")
library("car")

########
#part II - average cannabinoids for CBD, THC and CBG by location
#step 1 - find the average CBD percentage by location
summaryBy(comb_cbd ~ origin, data = chemotypes, FUN = list(mean), na.rm = T)

#step 2 - find the average THC percentage by location
summaryBy(comb_thc ~ origin, data = chemotypes, FUN = list(mean), na.rm = T)

#step 3 - find the average CBG percentage by location
summaryBy(comb_cbg ~ origin, data = chemotypes, FUN = list(mean), na.rm = T)

#########
#part III - sample sizes by location
#step 1 - Louisville sample size
louisville_all <- subset(chemotypes, origin = "Louisville")
    #examine the first six rows of "louisville_all" data
head(louisville_all)
    #examine "louisville_all" data by location
table(louisville_all$origin)
    #Louisville CBD 
louisville_cbd <- subset(louisville_all, comb_cbd >= 1)
    #examine the first six rows found to contain > 1% CBD at the Louisville location
head(louisville_cbd)
    #print to the console a table of the data 
table(louisville_cbd$origin)

#step 2 - Denver sample size
denver_all <- subset(chemotypes, origin = "Denver")

#step 3 - 



#########
#part IV - plot samples that produce >1% of cannabinoid measurements
par(mfrow = c(2, 2))
boxplot(comb_cbd ~ origin, data = )