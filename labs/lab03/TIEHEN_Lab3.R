#lab03 part I

#lab step #3: create a variable for the number of Cheetos bags and a separate variable for the number of guests
n_cheetos <- 5
n_guests <- 8

#lab step #5: create a variable for the average number of Cheetos bags consumed by guests
mean_chips <- 0.4

#lab step #7: calculate the expected number of leftover chips consumed by the guests and myself
(n_cheetos) - ((n_guests + 1) * mean_chips)

#lab03 part II

#lab step #8: create five vectors, one per episode, containing individual rankings

r_self <- c(7, 6, 5, 1, 2, 3, 4)
r_penny <- c(5, 7, 6, 3, 1, 2, 4)
r_jenny <- c(4, 3, 2, 7, 6, 5, 1)
r_lenny <- c(1, 7, 3, 4, 6, 5, 2)
r_stewie <- c(6, 7, 5, 4, 3, 1, 2)

#lab step #9: create variables for for Penny and Lenny's ranking for Episode IV by indexing the data
PennyIV <- r_penny[4]
LennyIV <- r_lenny[4]

#lab step #10: concatenate all five sets of rankings into a single data object
    #create a variable containing a data object (or matrix) with the combined set of all five sets of rankings
all_rankings <- cbind(r_self, r_penny, r_jenny, r_lenny, r_stewie)

#lab step #11: use the str() function to inspect the structure of PennyIV, r_penny and all_rankings
str(PennyIV)
str(r_penny)
str(all_rankings)
    #the str() function allows me to view the objects I previously created in my console in order to understand the differences; PennyIV shows only the number 3, r_penny shows the seven rankings for just Penny, and all_rankings shows that it contains all of the rankings specified by each individual

#lab step #12: create two data frames. the first data frame uses data.frame and requires the vector arguments to be included. the second data frame uses as.data.frame and only requires a data maxtrix in the argument(s).
df_rankings <- data.frame(r_self, r_penny, r_jenny, r_lenny, r_stewie)
df_rankings2 <- as.data.frame(all_rankings)
   
#lab step #13: 
    #view the dimensions of the data matrix and data frame
dim(all_rankings)
dim(df_rankings)
    #view the class of (or storage mode) of the data matrix and data frame
typeof(all_rankings)
typeof(df_rankings)
    #view the data matrix and data frame in my console to understand the differences
str(all_rankings)
str(df_rankings)
    #compare the data matrix and data frame, the output will show whether or not the values in the data matrix are equivalent to the values in the data frame (uses True/False in output)
all_rankings == df_rankings
    #(a-b) similarities: the dimensions are the same (dim); both data objects contain the same values (==) differences: the classes of the objects are different with all_rankings being "double" and df_rankings being "list" (typeof); the data matrix, all_rankings contains only values, the data frame contains values and text data (str)

#lab step #14: episode naming
    #create individual variables for each episode
I <- "I"
II <- "II"
III <- "III"
IV <- "IV"
V <- "V"
VI <- "VI"
VII <- "VII"
    #create a vector containing the episode values
ep_names <- c(I, II, III, IV, V, VI, VII)

#lab step #15: row naming 
    #add row names to all_rankings
row.names(all_rankings) <- ep_names
    #add row names to df_rankings
row.names(df_rankings) <- ep_names
    #view both data objects to make sure that the row.names function worked
    all_rankings
    df_rankings
    
#lab step #16: access the third row of all_rankings
    all_rankings[2,]

#lab step #17: access the fourth column of df_rankings
    df_rankings[,4]

#lab step #18: access "self" ranking for Episode V
    df_rankings[5,1]

#lab step #19: access Penny's ranking for Episode II
    df_rankings[2,2]

#lab step #20: access everyone's rankings for episodes IV - VI
    df_rankings[4:6,]
    
#lab step #21: access everyone's rankings for episodes II, V, and VII
    df_rankings[c(2, 5, 7),]

#lab step #22: access rankings for just Penny, Jenny, and Stewie for just episodes IV and VI
    df_rankings[c(4, 6), c(2, 3, 5)]

#lab step #23: switch Lenny's rankings for Episode II and V
    #create a new variable containing Lenny's rank for Episode II 
    L_rank_II <- df_rankings[2, 4]
    #make Lenny's Episode V rating equal Lenny's Episode II rating
        #change rating of 7 to rating of 6
    df_rankings[2, 4] = df_rankings[5, 4]
    #make Lenny's Episode II rating equal Lenny's Episode V rating
        #change rating of 6 to rating of 7
    df_rankings[5, 4] = L_rank_II

#lab step #24: access Penny's ranking from all_rankings and df_rankings for episode III using row/column names
    all_rankings["III","r_penny"]
    df_rankings["III","r_penny"]

#lab step #25: undo the switch from step #23 using names rather than indexes
    df_rankings["V", "r_lenny"] = df_rankings["II", "r_lenny"]
    df_rankings["II", "r_lenny"] = L_rank_II   

#lab step #26: use the '$' operator to re-do the switch from step #23
    df_rankings$r_lenny[2] = df_rankings$r_lenny[5]
    df_rankings$r_lenny[5] = L_rank_II

#lab step #27: save script, add, commit, push