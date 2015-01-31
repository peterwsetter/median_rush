# Component of median_rush.R script
# This script downloads the 2014 NFL regular season play-by-play data.
# The data is then read into a table named allPlays

fileURL <- "http://nflsavant.com/pbp_data.php?year=2014"
download.file(fileURL, "./pbp-2014.csv", method = "curl")
allPlays <- read.csv("pbp-2014.csv", header = TRUE)