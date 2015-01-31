# median_rush
Analysis on the median rush distance of NFL players and teams during the 2014 regular season.

## Questions under analysis
Which NFL players are the best rushers, as measured by median yards gained?

Typically, the effectiveness of ball carriers is measured using average yards per carry. Like all means, it can be skewed by a single outlier, typically a long run. A player can have a generally poor performance, having multiple carries of three or less yards, but have a high average due to a big play caused by a missed tackle. It was previously proposed by the Grantland NFL Podcast that the median rush distance would be a better statistic for comparing rusher effectiveness. While not difficult, finding the median can be relatively compared to finding the average, however, this is alleviated by using a software package like R.

## Data included in analysis
This analysis is performed using play-by-play data from the 2014 NFL regular season. The data was obtained from NFLSavant.com.

### Plays selected
The analysis was performed on plays classified as "RUSH" and "SCRAMBLE" in the original data that were not "NO PLAY". Scrambles are included in the analysis because scrambles contribute to the traditional rushing box score and defenses prepare for this possibility in their schemes. "NO PLAY" means there was an accepted penalty that nullified the play. 

## Functioning of the Script
The primary script is median_rush.R. When run, it sources the other necessary scripts to produce a data frame of players and their rushing statistics.

### acquire_data.R
This script downloads the 2014 play-by-play data from NFLSavant.com and reads it into a data table called allPlays.

### create_tidy.R
The original data frame is first converted into a dplyr data frame. The rush plays, as described above, are filtered into a new data frame called rushPlays.

The next steps of cleaning are to convert the GameDate column from a factor into a date, then convert the Yards column from an integer into a numeric. These are necessary for the cleaning and analysis steps that come later.

The script then sources two functions date2nflweek and playername. data2nflweek takes a date during the 2014 NFL season and determines which week of the NFL it occurred. playername takes the play description and extracts the name of the rusher. In most cases, the rusher is named first in the description. The special case is when a player declares eligible; when this occurs, the rushing player is named second.

The final step in the script is to create a tidy data set called tidyRush. Each row contains the week, player name, yards gained, offensive team, and defensive team. 

### Final steps in median_rush.R
After the creation of tidyRush, the final data set, medianRush, is created. Using dplyr, tidyRush is grouped by player then the following statistics are determined:
-Median rush distance (Median)
-Mean rush distance (Mean)
-Total number of carries (Carries)
-Total yards gained (Total)
The data frame is then filtered to only include rushers with at least 20 carries and  sorted from highest median to lowest. Last, medianRush is written to a csv file.