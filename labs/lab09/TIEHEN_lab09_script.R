#lab09 - preliminary steps
#set current working directory
setwd("C:/Users/luna/Google Drive/Spring_19/compbio/CompBioLabsAndHomework/labs/lab09")
#import data set with the "stringAsFactors" option set to False
camData <- read.csv("Cusack_et_al_random_versus_trail_camera_trap_data_Ruaha_2013_14.csv", stringsAsFactors = F)

#lab09 - problem 1
#open the help file for strptime
?strptime
#view the data set in another window to understand the data set 
View(camData)
#create a vector containing the first date in the DateTime column within camData
oneDate <- camData$DateTime[1]
#use strptime with the oneDate vector to test data, does not work - returns NA
strptime(oneDate, format = "%d-%m-%Y %H:%M")
#replace "-" with "/" in the strptime function, this works for "oneDate"
strptime(oneDate, format = "%d/%m/%Y %H:%M")
#create a vector for the entire DateTime column in the data set
DateTime <- camData$DateTime
#try to use this new format across the entire DateTime vector
strptime(DateTime, format = "%d/%m/%Y %H:%M")
#this code runs and gives me the format that I want for the years which were given a four-digit format, problem 2 fixes the dates given in the two-digit format 
    #assign this to a variable to continue working on this in problem 2
newDates <- strptime(DateTime, format = "%d/%m/%Y %H:%M")

#lab09 - problem 2 
#run code that will change the two-digit formats to four-digit formats
#see which items have years < 100, everything with "TRUE" needs to be changed
newDates < 100
#provide the same outuput for years that are greater than 2000, everything with "FALSE" needs to be changed
as.numeric(format(newDates, "%Y")) > 2000
#keeeeeeep tryyyyyinggggg :'(