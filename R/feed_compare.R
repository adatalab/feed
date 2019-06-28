#' feed_compare
#'
#' A function to compare each result of feed composition.
#' @param feed1 1st feed chemical composition that you want to compare.
#' @param feed2 2nd feed chemical composition that you want to compare.
#' @param name1 1st feed name that you want to compare.
#' @param name2 2nd feed name that you want to compare.
#' @param radar TRUE returns radar chart.
#' @keywords feed formulation
#' @import dplyr
#' @import reshape2
#' @import fmsb
#' @export
#' @examples
#' feed1 <- feed::feed_info("https://www.feedipedia.org/node/556", 2)
#' feed2 <- feed::feed_info("https://www.feedipedia.org/node/674", 3)
#' feed1 <- feed1[[1]]
#' feed2 <- feed2[[1]]
#' feed_compare(feed1, feed2, name1 = "corn", name2 = "sbm", radar = TRUE)
feed_compare <- function(feed1, feed2, name1 = "first", name2 = "second", radar = TRUE) {
  feed1$Avg <- as.numeric(feed1$Avg)
  feed2$Avg <- as.numeric(feed2$Avg)

  feed1 <- feed1[, c(1:3)]
  feed2 <- feed2[, c(1, 3)]

  colnames(feed1) <- c("composition", "unit", name1)
  colnames(feed2) <- c("composition", name2)

  join <- dplyr::left_join(feed1, feed2, by = "composition")
  join$diff <- join[, 3] - join[, 4]
  join$percentage <- round(join[, 4] / join[, 3], 3)

  print(join)

  if (radar == TRUE) {
    radar <- join[, c(1, 3, 4)]
    radar <- reshape2::dcast(reshape2::melt(radar), variable ~ composition)

    normalize <- function(x) return(x / max(x))
    radar_norm <- radar
    radar_norm[, 2:ncol(radar)] <- as.data.frame(lapply(radar[, 2:ncol(radar)], normalize))

    layout <- matrix(nrow = 2, ncol = ncol(radar_norm))
    colnames(layout) <- colnames(radar_norm)
    layout[1, ] <- 1
    layout[2, ] <- 0

    bind <- rbind(layout, radar_norm)

    fmsb::radarchart(bind[, 2:ncol(bind)], axistype = 5, pcol = c("red", "black"), axislabcol = "grey")
    legend(x = 1, y = 1.3, legend = bind[-c(1, 2), 1], bty = "n", pch = 20, col = c("red", "black"), text.col = "black")
  }
}
