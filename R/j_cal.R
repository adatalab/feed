#' j_cal
#'
#' This function converts joule into calorie.
#' @param joule joule.
#' @param standard "thermochemical" = Thermochemical calorie; "4" = 4°C calorie; "15" = 15°C calorie; "20" = 20°C calorie; "mean" = mean calorie (https://en.wikipedia.org/wiki/Calorie). 
#' @keywords feed formulation
#' @export
#' @examples
#' j_cal(joule = 4000, standard = "15")

j_cal <- function(joule, standard = "15") {
  if (standard == "thermochemical") {
    return(joule/4.184)
  }
  
  if (standard == "4" | standard == 4) {
    return(joule/4.204)
  }
  
  if (standard == "15" | standard == 15) {
    return(joule/4.1855)
  }
  
  if (standard == "20" | standard == 20) {
    return(joule/4.182)
  }
  
  if (standard == "mean") {
    return(joule/4.190)
  }
}

