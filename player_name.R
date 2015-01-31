playername <- function(playinfo) {
        # Input a character string, playinfo, returns the name of the player
        # The expected input is a string containing a description of a play
        library(stringr)
        # Player name pattern f.last
        pnp <- "\\w\\.\\w+" 
        # Look for the speical case when a lineman reports as eligible
        # Typically the ball carrier is first name in the string.
        # In the special case, the first name is the lineman.
        if(str_detect(playinfo, "ELIGIBLE") == FALSE) {
                return(str_extract(playinfo, pnp))
        }
        else {
                players <- str_extract_all(playinfo, pnp)
                return(players[[1]][2])    
        }
}