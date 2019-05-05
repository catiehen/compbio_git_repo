#part I - data set up
#step 1 - set working directory and call in libraries associated with any code used in this analyses
setwd("C:/Users/luna/Google Drive/Spring_19/compbio/CompBioLabsAndHomework/independent_project/Assignment9")
library("dplyr")
library("doBy")
library("tidyverse")

#step 2 - convert .txt data files to .csv files 
    #read .txt files into three lists
txt1 <- read.delim("rawData.txt", header = TRUE)
txt2 <- read.delim("louisvilleData.txt", header = TRUE)
    #convert lists to .csv files to be created in current working directory
write.table(txt1, file = "rawData.csv", sep = ",", col.names = TRUE, row.names = FALSE)
write.table(txt2, file = "louisvilleData.csv", sep = ",", col.names = TRUE, row.names = FALSE)

#step 3 - read in .csv files as objects named "rawData" and "louisvilleData"
rawData <- read.csv("rawData.csv")
louisvilleData <- read.csv("louisvilleData.csv")

#step 4 - examine newly created objects
View(rawData)
View(louisvilleData)

#step 5 - merge data from "rawData" and "louisvilleData" to create the new object "chemotypes"
merge <- list.files(pattern = ".csv")
chemotypes <- do.call("rbind", lapply(merge, read.csv, header = TRUE))
    #examine "chemotypes" to ensure the file merging was successful - 3154 rows total should be seen, including the header row
View(chemotypes)

########
#part II - average cannabinoids for CBD, THC and CBG by location
#step 1 - find the average CBD percentage by location
summaryBy(comb_cbd ~ origin, data = chemotypes, FUN = list(mean), na.rm = T)
    # origin        comb_cbd.mean
    #1 Louisville     1.0906579
    #2     Denver     0.4081071
    #3       NIDA     3.5495918
    #4    Oakland     1.3555987
    #5 Sacramento     1.4071778
    #6    Seattle     0.4217912

#step 2 - find the average THC percentage by location
summaryBy(comb_thc ~ origin, data = chemotypes, FUN = list(mean), na.rm = T)
    #origin          comb_thc.mean
    #1 Louisville     19.103618
    #2     Denver     14.240390
    #3       NIDA      3.443265
    #4    Oakland     13.841415
    #5 Sacramento     15.946984
    #6    Seattle     19.047067

#step 3 - find the average CBG percentage by location
summaryBy(comb_cbg ~ origin, data = chemotypes, FUN = list(mean), na.rm = T)
    #origin          comb_cbg.mean
    #1 Louisville    0.06578947
    #2     Denver    0.51645566
    #3       NIDA    0.21687500
    #4    Oakland    0.47217424
    #5 Sacramento    0.81475659
    #6    Seattle    0.59092744


#########
#part III - sample sizes by location
#step 1a - subset Louisville data
louisvilleSS_all <- subset(chemotypes, origin = "Louisville")
#step 1b - print to the console a table of the sample sizes by location
table(louisvilleSS_all$origin)
    #Louisville     Denver       NIDA    Oakland Sacramento   Seattle
    #76             1141         98        755        981        103
#step 1c - subset Louisville CBD data to exclude samples testing less than 1%
louisvilleSS_cbd <- subset(louisvilleSS_all, comb_cbd >= 1)
#step 1d - print to the console a table of Louisville CBD data 
table(louisvilleSS_cbd$origin)
    #Louisville     Denver       NIDA    Oakland Sacramento    Seattle 
    #11             42         56        110        101          4
#step 1e - average CBD content of the Louisville samples
mean(subset(louisvilleSS_cbd, origin == "Louisville")$comb_cbd)
    #6.381818
#step 1f - subset Louisville THC data to exclude samples testing less than 1%
louisvilleSS_thc <- subset(louisvilleSS_all, comb_thc >= 1)
#step 1g - print to the console a table of the THC data to include all locations
table(louisvilleSS_thc$origin)
    #Louisville     Denver       NIDA    Oakland Sacramento    Seattle 
    #74             1112         64        692        952        103
#step 1h - subset Louisville CBG data to exclude samples testing less than 1%
louisvilleSS_cbg <- subset(louisvilleSS_all, comb_cbg >= 1)
#step 1i - print to the console a table of the Louisville CBG data
table(louisvilleSS_cbg$origin)
    #Louisville     Denver  NIDA    Oakland Sacramento  Seattle
        #3         98       1         41      259         12
#step 1j - average THC content of the Louisville samples
mean(subset(louisvilleSS_thc, origin == "Louisville")$comb_thc)
    #19.59581

#step 2a - subset Denver data
denverSS_all <- subset(chemotypes, origin = "Denver")
#step 2b - print to the console a table of the sample sizes by location
table(denverSS_all$origin)
    #Louisville     Denver       NIDA    Oakland Sacramento   Seattle
    #76             1141         98        755        981        103
#step 2c - subset Denver data to include all valid CBG data
denverSS_NAs <- subset(denverSS_all, comb_cbg != "NA")
#step 2d - print to the console a table of Denver data with only vaild CBG data to include all locations
table(denverSS_NAs$origin)
    #Louisville     Denver      NIDA    Oakland Sacramento    Seattle 
    #76             992         96        481        981        103
#step 2e - subset Denver CBD data to exclude samples testing less than 1%
denverSS_cbd <- subset(denverSS_all, comb_cbd >= 1)
#step 2f - print to the console a table of the Denver CBD data to include all locations
table(denverSS_cbd$origin)
    #Louisville     Denver      NIDA    Oakland Sacramento    Seattle 
    #11             42         56        110        101          4 
#step 2g - average CBD content of Denver samples
mean(subset(denverSS_cbd, origin == "Denver")$comb_cbd)
    #10.54378
#step 2h - subset Denver CBN data to exclude samples testing less than 1%
denverSS_cbn <- subset(denverSS_all, comb_cbn >= 1)
#step 2i - print to the console a table of the Denver CBN data to include all locations
table(denverSS_cbn$origin)
    #no samples
#step 2j - subset Denver THC data to exclude samples testing less than 1%
denverSS_thc <- subset(denverSS_all, comb_thc >= 1)
#step 2k - print to the console a table of the Denver THC data to include all locations
table(denverSS_thc$origin)
    #Louisville     Denver       NIDA    Oakland Sacramento    Seattle 
    #74             1112         64        692        952        103 
#step 2l - subset Denver CBG data to exclude samples testing less than 1%
denverSS_cbg <- subset(denverSS_all, comb_cbg >= 1)
#step 2m - print to the console a table of the Denver CBG data to include all locations
table(denverSS_cbg$origin)
    #Louisville     Denver       NIDA    Oakland Sacramento    Seattle 
    #3              98          1         41        259         12
#step 2n - subset Denver THCv data to exclude samples testing less than 1%
denverSS_thcv <- subset(denverSS_all, comb_thcv >= 1)
#step 2o -  print to the console a table of the Denver THCv data to include all locations
table(denverSS_thcv$origin)
    #Louisville     Denver       NIDA    Oakland Sacramento    Seattle 
    #0              12          0          6         21          1
#step 2p - subset Denver CBC data to exclude samples testing less than 1%
denverSS_cbc <- subset(denverSS_all, comb_cbc >= 1)
#step 2q - print to the console a table of the Denver CBC data to include all locations
table(denverSS_cbc$origin)
    #Louisville     Denver       NIDA    Oakland Sacramento    Seattle 
    #0              0          0          0          2          0

#step 3a - subset NIDA data
NIDA_SS_all <- subset(chemotypes, origin = "NIDA")
#step 3b - subset NIDA data to include all valid THCv data
NIDA_SS_NAs <- subset(NIDA_SS_all, comb_thcv != "NA")
#step 3c - print to the console a table of NIDA data with only vaild THCv data to include all locations
table(NIDA_SS_NAs$origin)
    #Louisville     Denver       NIDA    Oakland Sacramento    Seattle 
    #76             992         90        481        981        103
#step 3d - subset NIDA data to include all valid CBC data
NIDA_SS_NAs2 <- subset(NIDA_SS_all, comb_cbc != "NA")
#step 3e - print to the console a table of NIDA data with only vaild CBC data to include all locations
table(NIDA_SS_NAs2$origin)
    #Louisville     Denver       NIDA    Oakland Sacramento    Seattle 
    #76             0         96        481        981          0
#step 3f - subset NIDA CBD data to exclude samples testing less than 1%
NIDA_SS_cbd <- subset(NIDA_SS_all, comb_cbd >= 1)
#step 3g - print to the console a table of the NIDA CBD data to include all locations
table(NIDA_SS_cbd$origin)
    #Louisville     Denver       NIDA    Oakland Sacramento    Seattle 
    #11             42         56        110        101          4
#step 3h - subset NIDA CBN data to exclude samples testing less than 1%
NIDA_SS_cbn <- subset(NIDA_SS_all, comb_cbn >= 1)
#step 3i - print to the console a table of the NIDA CBN data to include all locations
table(NIDA_SS_cbn$origin)
    #no samples
#step 3j - subset NIDA THC data to exclude samples testing less than 1%
NIDA_SS_thc <- subset(NIDA_SS_all, comb_thc >= 1)
#step 3k - print to the console a table of the NIDA THC data to include all locations
table(NIDA_SS_thc$origin)
    #Louisville     Denver       NIDA    Oakland Sacramento    Seattle 
    #74             1112         64        692        952        103
#step 3l - subset NIDA CBG data to exclude samples testing less than 1%
NIDA_SS_cbg <- subset(NIDA_SS_all, comb_cbg >= 1)
#step 3m - print to the console a table of the NIDA CBG data to include all locations
table(NIDA_SS_cbg$origin)
    #Louisville     Denver       NIDA    Oakland Sacramento    Seattle 
    #3              98          1         41        259         12 
#step 3n - subset NIDA THCv data to exclude samples testing less than 1%
NIDA_SS_thcv <- subset(NIDA_SS_all, comb_thcv >= 1)
#step 3o - print to the console a table of the NIDA THCv data to include all locations
table(NIDA_SS_thcv$origin)
    #Louisville     Denver       NIDA    Oakland Sacramento    Seattle 
    #0              12          0          6         21          1
#step 3p - subset NIDA CBC data to exclude samples testing less than 1%
NIDA_SS_cbc <- subset(NIDA_SS_all, comb_cbc >= 1)
#step 3q - print to the console a table of the NIDA CBC data to include all locations
table(NIDA_SS_cbc$origin)
    #Louisville     Denver      NIDA    Oakland Sacramento    Seattle 
    #0              0          0          0          2          0

#step 4a - subset THC and CBD data to exclude samples testing less than 1% for all locations
thc_cbd_SS1 <- subset(chemotypes, comb_cbd >= 1 & comb_thc >= 1)
#step 4b - print to the console a table of all THC and CBD data for all locations
table(thc_cbd_SS1$origin)
    #Louisville     Denver       NIDA    Oakland Sacramento    Seattle 
    #9              21         24         77         81          4

#step 5a - subset Seattle data
seattleSS <- subset(chemotypes, origin = "Seattle")
#step 5b - subset Seattle CBD data to exclude samples testing less than 1% for all locations
seattle_SS1 <- subset(seattleSS, comb_cbd >= 1)
#step 5c - print to the console a table of the Seattle CBD data to include all locations
table(seattle_SS1$origin)
    #Louisville     Denver       NIDA    Oakland Sacramento    Seattle 
    #11             42         56        110        101          4

#step 6a - subset Oakland data
oaklandSS <- subset(chemotypes, origin = "Oakland")
#step 6b - subset to Oakland data to include all valid CBC data
oakland_SS1 <- subset(oaklandSS, comb_cbc != "NA")
#step 6c - print to the console a table of Oakland data with only vaild CBC data to include all locations
table(oakland_SS1$origin)
    #Louisville     Denver       NIDA    Oakland Sacramento    Seattle 
    #76             0         96        481        981          0
#step 6d - subset the Oakland data to include all valid CBN
oakland_SS2 <- subset(oaklandSS, comb_cbn != "NA")
#step 6e - print to the console a table of Oakland data with only vaild CBN data to include all locations
table(oakland_SS1$origin)
    #Louisville     Denver       NIDA    Oakland Sacramento    Seattle 
    #76             0         96        481        981          0

#########
#part IV - one-way ANOVA's for samples with greater than 1% of cannabinoid measurements
#step 1 - utilize the which function to create a vector of indexes from the CBD measurements what are greater than or equal to 1%, called "cbd"
cbd <- chemotypes[which(chemotypes$comb_cbd >= 1), ]
#step 2a - CBD ANOVA
aovCBD <- aov(comb_cbd ~ origin, data = cbd)
    #examine results
summary(aovCBD)
    #significant results: <2e-16
#step 2b - CBD Tukey
TukeyHSD(aovCBD)
    #examine Tukey analyses - create a new object with this analyses
tukeyCBD <- TukeyHSD(aovCBD)

#step 3a - THC ANOVA
thc <- chemotypes[which(chemotypes$comb_thc >= 1), ]
aovTHC <- aov(comb_thc ~ origin, data = thc)
    #examine results
summary(aovTHC)
    #significant results: <2e-16
#step 3b - CBD Tukey
TukeyHSD(aovTHC)
    #examine Tukey analyses - create a new object with this analyses
tukeyTHC <- TukeyHSD(aovTHC)

#step 4a - CBG ANOVA
cbg <- chemotypes[which(chemotypes$comb_cbg >= 1), ]
aovCBG <- aov(comb_cbg ~ origin, data = cbg)
#examine results
summary(aovCBG)
#insignificant results: 0.576, no Tukey test performed

#######
#part V - plot samples that produce greater than 1% of cannabinoid measurements as a box and whisker plot to indicate skewness of the data
#step 1 - plot CBD Tukey results
plot(tukeyCBD)
#step 2 - plot THC Tukey results 
plot(tukeyTHC)