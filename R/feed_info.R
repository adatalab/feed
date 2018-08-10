#' feed_info
#'
#' This function show the result of tables of URL. If you use extract option, a list is returned for each nutrient composition of the specific feed.
#' @param url A URL that you want to scraping.
#' @param extract A number of list for nutreint composition.
#' @keywords feed, feedipedia
#' @export
#' @import rvest
#' @import dplyr
#' @examples
#' feed_info(url="https://www.feedipedia.org/node/556")
#' feed_info(url="https://www.feedipedia.org/node/556",extract=2)

feed_info <- function(url,extract=0){
  # package
  stopifnot(require(rvest), require(dplyr))

  html <- read_html(url, encoding="UTF-8")

  #names
  h1 <- html %>% html_nodes("h1") %>% html_text()
  h2 <- html %>% html_nodes("h2") %>% html_text()
  h3 <- html %>% html_nodes("h3") %>% html_text()

  #nutrients
  nutrients <- html %>% html_nodes("table") %>% html_table()
  nutrients <- nutrients[1:ifelse(length(nutrients)-1==0,1,length(nutrients)-1)]
  footnote <- "The asterisk * indicates that the average value was obtained by an equation."
  nutrients <- append(nutrients,footnote)
  
  if(extract != 0){
    a <- nutrients[[extract]]
    
    end <- c(which(a[,2] == '') - 1,nrow(a))
    start <- c(2,which(a[,2] == '') + 2)
    
    df <- list()
    for(i in 1:length(end)){
      df[[i]] <- a[start[i]:end[i],]
      names(df[i]) <- a[start[i]-1,1]
      colnames(df[[i]]) <- a[start[i]-1,]
    }
    
    df <- append(df,footnote)
    return(df)
    
  }else{
    print(nutrients)
    print(list(h1,h2,h3))  
  }
  
}
