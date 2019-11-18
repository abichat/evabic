#' Named logical to character
#'
#' Extracts names of \code{x} where \code{x} is \code{TRUE}
#'
#' @param x vector
#'
#' @return a vector of the same size
#'
#' @examples
#' x <- c(a = TRUE, b = FALSE, c = FALSE, d = TRUE)
#' evabic:::nl2c(x)
#'
nl2c <- function(x){
  if(is.logical(x)) {
    return(names(x)[x])
  } else {
    return(x)
  }
}
