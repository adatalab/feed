#' asis_dm
#'
#' This function convert as-is basis into dry-matter basis.
#' @param composition feed chemical composition (as-is basis).
#' @param dm percentage of dry matter contents (without moisture) of feed.
#' @param digits integer indicating the number of decimal places
#' @keywords feed formulation
#' @export
#' @examples
#' df <- data.frame(nutrient=c("CP","NDF","EE","Ash"),composition=c(10,30,5,2))
#' asis_dm(df$composition,85)

asis_dm <- function(composition, dm, digits=2) {
  round(composition/dm*100,digits)
}