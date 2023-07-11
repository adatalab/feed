#' feed_info
#'
#' This function show the result of tables of URL.
#' @param url A URL that you want to scraping.
#' @keywords feed, feedipedia
#' @export
#' @import rvest
#' @import tidyr
#' @import dplyr
#' @import janitor
#' @import tibble
#' @import readr
#' @examples
#' feed_info(url="https://www.feedipedia.org/node/556")

feed_info <- function(url) {
  stopifnot(require(rvest), require(dplyr), require(readr))

  suppressWarnings({

    html <- read_html(url, encoding = "UTF-8")

    # names
    h1 <- html %>% html_nodes("h1") %>% html_text()
    h2 <- html %>% html_nodes("h2") %>% html_text()
    h3 <- html %>% html_nodes("h3") %>% html_text()

    # nutrients
    nutrients <- html %>% html_nodes("table") %>% html_table()
    list <- lapply(nutrients, function(df) subset(df, df[1, 1] == "Main analysis"))

    change_colnames <- function(df) {
      colnames(df) <- unlist(df[1, ])
      df <- df[-1, ] %>% janitor::clean_names()
      return(df)
    }

    list <- lapply(list, change_colnames)
    list <- list[sapply(list, function(df) !(nrow(df) == 0))]
    h3 <- h3[-c(1:6)]

    if(length(list) == length(h3)) {

      result <- purrr::map2_df(list, h3, function(list, h3) {

          list %>% select(1, 3) %>%
            filter(!is.na(avg)) %>%
            mutate(avg = parse_number(avg)) %>%
            filter(!is.na(avg)) %>%
            tidyr::pivot_wider(names_from = main_analysis, values_from = avg) %>%
            mutate(feed = h3) %>%
            mutate(reference = url) %>%
            select(feed, reference, everything()) %>%
            janitor::clean_names()

      })

    } else {result <- tibble()}

  })


  return(result)

}





