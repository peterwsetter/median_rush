
# Source acquire_date.R, which downloads the play-by-play data
# from the 2014 NFL Season. The data is then read into data frame.
#source("acquire_data.R")

# Source create_tidy, which creates a tidy data set of all rushes
#source("create_tidy.R")

# Obtain list of players and teams from tidy data set
players <- unique(tidyRush$Players)
teams <- unique(tidyRush$OffenseTeam)

medianRush <- tidyRush %>%
        group_by(Player) %>%
        summarize(Median = median(Yards), 
                  Mean = round(mean(Yards), 1),
                  Carries = n(),
                  Total = sum(Yards)) %>%
        filter(Carries > 50) %>%
        arrange(desc(Median))

#write.csv(medianRush, file = "median_rush.csv")