# Component of median_rush.R script
# This script is dependent on acquire_data.R 
# This script uses the allPlays data table to create a tidy data
# set of only rushing plays.
# Script sources player_name.R and date2nflweek.R for data cleaning.

library(dplyr)
allPlays <- tbl_df(allPlays)
# Mofified code from http://stackoverflow.com/questions/22850026/filtering-row-which-contains-a-certain-string-using-dplyr
rushPlays <- filter(allPlays, grepl('RUSH|SCRAMBLE', PlayType), IsNoPlay == 0)

# Convert GameDate column from factor to date format
rushPlays$GameDate <- as.Date(rushPlays$GameDate)

# Convert Rush column from int to numeric
rushPlays$Yards <- as.numeric(rushPlays$Yards)

# Source date2nflweek.R, which converts a date to the corresponding week of the NFL
source("date2nflweek.R")

# Source player_name, which returns the name of the player from a play description
source("player_name.R")

# Create a new row $Week based on the date.
# Create a new row $Player which identifies the player carrying the ball
for (i in 1:nrow(rushPlays)){
        rushPlays$Week[i] <- date2nflweek(rushPlays$GameDate[i])
        rushPlays$Player[i] <- playername(rushPlays$Description[i])
}

# create a new tidy data set
tidyRush <- rushPlays %>%
                select(Week, Player, Yards, OffenseTeam, DefenseTeam)

