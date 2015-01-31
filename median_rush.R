# This script determines median rushing yards for players with at least
# 20 carries during the 2014 NFL regular season.
# The final data frame is written as a csv file.
# A histogram of the median yards gained is made into a png.
# This script sources acquire_data.R and create_tidy.R to obtain the
# data and create a tidy data set of all rushing plays.
# See the README.md for an overview.

# Source acquire_date.R, which downloads the play-by-play data
# from the 2014 NFL Season. The data is then read into data frame.
source("acquire_data.R")

# Source create_tidy, which creates a tidy data set of all rushes
source("create_tidy.R")

# Create the final data frame of player statistics.
library(dplyr)
medianRush <- tidyRush %>%
        group_by(Player) %>%
        summarize(Median = median(Yards), 
                  Mean = round(mean(Yards), 1),
                  Carries = n(),
                  Total = sum(Yards)) %>%
        filter(Carries > 20) %>%
        arrange(desc(Median))

write.csv(medianRush, file = "median_rush.csv")

png("medianhist.png")
ggplot(medianRush, aes(medianRush$Median)) + 
        geom_histogram(binwidth = 1, position = "identity", alpha = 0.8) + 
        xlab("Median Yards Gained") + 
        scale_x_continuous(breaks = 1:11) + 
        ylab("Players (count)") + 
        ggtitle("Frequency of Median Yards Gained") + 
        # Add vertical lines to demark quantiles
        geom_vline(aes(xintercept = 8), linetype = "dashed") + 
        geom_vline(aes(xintercept = 4), linetype = "dashed") + 
        geom_vline(aes(xintercept = 3), linetype = "dashed")
dev.off()