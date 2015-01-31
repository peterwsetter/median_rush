date2nflweek <- function(date) {
        # Takes a date from 2014 and returns the corresponding week of the
        # NFL regular season
        library(lubridate)
        if (date >= '2014-09-04' && date <= '2014-09-09') {
                return(1)
        }
        else if (date >= '2014-09-10' && date <= '2014-09-16') {
                return(2)
        }
        else if (date >= '2014-09-17' && date <= '2014-09-23') {
                return(3)
        }
        else if (date >= '2014-09-24' && date <= '2014-09-30') {
                return(4)
        }
        else if (date >= '2014-10-01' && date <= '2014-10-07') {
                return(5)
        }
        else if (date >= '2014-10-08' && date <= '2014-10-14') {
                return(6)
        }
        else if (date >= '2014-10-15' && date <= '2014-10-21') {
                return(7)
        }
        else if (date >= '2014-10-22' && date <= '2014-10-28') {
                return(8)
        }
        else if (date >= '2014-10-29' && date <= '2014-11-04') {
                return(9)
        }
        else if (date >= '2014-11-04' && date <= '2014-11-11') {
                return(10)
        }
        else if (date >= '2014-11-12' && date <= '2014-11-18') {
                return(11)
        }
        else if (date >= '2014-11-19' && date <= '2014-11-25') {
                return(12)
        }
        else if (date >= '2014-11-26' && date <= '2014-12-02') {
                return(13)
        }
        else if (date >= '2014-12-03' && date <= '2014-12-09') {
                return(14)
        }
        else if (date >= '2014-12-10' && date <= '2014-12-16') {
                return(15)
        }
        else if (date >= '2014-12-17' && date <= '2014-12-23') {
                return(16)
        }
        else if (date >= '2014-12-24' && date <= '2014-12-30') {
                return(17)
        }
}