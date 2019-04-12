#set up
setwd("C:/Users/luna/Google Drive/Spring_19/compbio/CompBioLabsAndHomework/labs/lab12")
library("tidyverse")
library("ggplot2")
library("dplyr")
#read in data
camData <- read.csv("camData.csv")

#problem 1: a bar plot in ggplot
ggplot(camData, aes(Species)) + geom_bar()

#problem 2: rotate the axis tick labels
ggplot(camData, aes(Species)) + geom_bar() + theme(axis.text.x = element_text(angle = 90, hjust = 1))

#problem 3: flip the axes, sort the species from least to most abundant, also transform the count axis to be logarithmic to see the smaller count values more easily
camDataSorted <- summarise(group_by(camData, Species))
#plot
ggplot(camData, aes()) + geom_bar()
