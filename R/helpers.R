#' Named logical to character
#'
#' Extracts names of \code{x} where \code{x} is \code{TRUE}
#'
#' @param x vector
#'
#' @return a vector of the same size
#'
#' @keywords internal
#'
#' @examples
#' x <- c(a = TRUE, b = FALSE, c = FALSE, d = TRUE)
#' evabic:::nl2c(x)
#'
nl2c <- function(x) {
  if (is.logical(x)) {
    if (is.null(names(x))) {
      stop("You need names for your logical vector. ",
           "Consider using 'evabic::add_names'.")
      }
    return(names(x)[x])
  } else {
    return(x)
  }
}

#' Repeat 0
#'
#' @param n The number of time to repeat
#'
#' @return A character.
#'
#' @keywords internal
#'
rep_0 <- function(n){
  paste(rep(0, n), collapse = "")
}

#' Add names to a vector
#'
#' Add names to a vector, with default names.
#'
#' @param x A vector.
#' @param names Vector of names to add. If \code{NULL}, default names are added.
#' @param prefix The prefix to add before default names. Useful only if
#' \code{names} is set to \code{NULL}.
#'
#' @return A named vector
#' @export
#'
#' @examples
#' add_names(month.name)
add_names <- function(x, names = NULL, prefix = "x"){

  if(is.null(names)){
    l <- length(x)
    v <- seq_len(l)
    nbr0 <- floor(log(l, base = 10)) - floor(log(v, base = 10))
    zeros <- vapply(nbr0, rep_0, FUN.VALUE = character(1))
    names <- paste0(prefix, zeros, v)
  }

  names(x) <- names
  x
}
