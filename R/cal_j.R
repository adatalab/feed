#' cal_j
#'
#' This function converts calorie into joule.
#' @param cal calorie.
#' @param standard "thermochemical" = Thermochemical calorie; "4" = 4°C calorie; "15" = 15°C calorie; "20" = 20°C calorie; "mean" = mean calorie (https://en.wikipedia.org/wiki/Calorie). 
#' @keywords feed formulation
#' @export
#' @examples
#' cal_j(cal = 5000, standard = "15")

cal_j <- function(cal, standard = "15") {
  if (standard == "thermochemical") {
    return(cal*4.184)
  }
  
  if (standard == "4" | standard == 4) {
    return(cal*4.204)
  }
  
  if (standard == "15" | standard == 15) {
    return(cal*4.1855)
  }
  
  if (standard == "20" | standard == 20) {
    return(cal*4.182)
  }
  
  if (standard == "mean") {
    return(cal*4.190)
  }
}
