#' dm_asis
#'
#' This function convert dry-matter basis into as-is basis.
#' @param composition feed chemical composition (dry-matter basis).
#' @param dm percentage of dry matter contents (without moisture) of feed.
#' @param digits integer indicating the number of decimal places
#' @keywords feed formulation
#' @export
#' @examples
#' df <- data.frame(nutrient=c("CP","NDF","EE","Ash"),composition=c(10,30,5,2))
#' dm_asis(df$composition,85)

dm_asis <- function(composition, dm, digits=2) {
  round(composition*dm/100,digits)
}
