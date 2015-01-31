playername <- function(playinfo) {
  ## Input a character string, playinfo, returns the name of the player
  library(stringr)
  ## Player name pattern f.last
  pnp <- "\\w\\.\\w+" 
  if(str_detect(playinfo, "ELIGIBLE") == FALSE) {
          return(str_extract(playinfo, pnp))
  }
  else {
          players <- str_extract_all(playinfo, pnp)
          return(players[[1]][2])    
  }
}