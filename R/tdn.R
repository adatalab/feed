#' tdn
#'
#' This function calculate the TDN of cattle. Equation is TDN = 0.85CP + 2.25*0.8EE + 0.6CF + 0.8NFE.
#' @param cp CP.
#' @param ee EE.
#' @param cf CF.
#' @param nfe NFE(100 - CP - EE - CF - Ash).
#' @keywords feed formulation
#' @export
#' @examples
#' tdn(cp = 18, ee = 9, cf = 35, nfe = 19)

tdn <- function(cp, ee, cf, nfe) {
  dig <- c(0.85, 0.8 * 2.25, 0.6, 0.8)
  tdn <- as.numeric(cp) * dig[1] + as.numeric(ee) * dig[2] + as.numeric(cf) * dig[3] + as.numeric(nfe) * dig[4]
  return(tdn)
}
