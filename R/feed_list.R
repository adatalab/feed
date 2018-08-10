#' feed_list
#'
#' This function showed a feed list at feedipedia.org.
#' @param category A category that you want to find(all; forage; plantProduct; animalOrigin; other)
#' @keywords feed, feedipedia
#' @import rvest
#' @import dplyr
#' @export
#' @examples
#' feed_list("all")
#' feed_list("forage")
#' feed_list("plantProduct")
#' feed_list("animalOrigin")
#' feed_list("other")
 
feed_list<-function(category="all") {
  # package
  stopifnot(require(rvest), require(dplyr))
  
  callsign<-c("all", "forage", "other", "plantProduct","animalOrigin")
  my.url.list <- c("https://www.feedipedia.org/content/feeds?category=All",
                   "https://www.feedipedia.org/content/feeds?category=15965",
                   "https://www.feedipedia.org/content/feeds?category=15969",
                   "https://www.feedipedia.org/content/feeds?category=15967",
                   "https://www.feedipedia.org/content/feeds?category=15968")
  
  url<-my.url.list[match(category,callsign)]
  
  result <- read_html(url, encoding="UTF-8") %>%
    html_nodes("table") %>%
    html_table() # search results
  
  # return
  return(result)
}
