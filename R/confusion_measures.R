#' Confusion measures.
#'
#' Basic measures from the confusion matrix.
#'
#' See \code{\link{ebc_allmeasures}} for the description of the measures.
#'
#' @param detected Vector of elements that are detected.
#' @param true Vector of element that are supposed to be detected.
#' @param all Vector of all elements.
#' @param m Total number of elements.
#' @return An integer.
#' @export
#'
#' @seealso \code{\link{ebc_TPR}}, \code{\link{ebc_tidy}},
#' \code{\link{ebc_allmeasures}}
#'
#' @examples
#' ebc_TP(detected = c("A", "C", "D"), true = c("A", "B", "C"))
#' ebc_FP(detected = c("A", "C", "D"), true = c("A", "B", "C"))
#' ebc_FN(detected = c("A", "C", "D"), true = c("A", "B", "C"))
#' ebc_TN(detected = c("A", "C", "D"), true = c("A", "B", "C"),
#'        all = LETTERS[1:6])
#' ebc_TN(detected = c("A", "C", "D"), true = c("A", "B", "C"), m = 6)
ebc_TP <- function(detected, true){
  detected <- nl2c(detected)
  true <- nl2c(true)
  length(intersect(detected, true))
}

#' @rdname ebc_TP
#' @export
ebc_FP <- function(detected, true){
  detected <- nl2c(detected)
  true <- nl2c(true)
  length(setdiff(detected, true))
}

#' @rdname ebc_TP
#' @export
ebc_FN <- function(detected, true){
  detected <- nl2c(detected)
  true <- nl2c(true)
  length(setdiff(true, detected))
}

#' @rdname ebc_TP
#' @export
ebc_TN <- function(detected, true, all, m = length(all)){
  detected <- nl2c(detected)
  true <- nl2c(true)
  m - length(union(detected, true))
}


#' Confusion matrix
#'
#' Compute the the confusion matrix
#'
#' See \code{\link{ebc_allmeasures}} for the description of the measures.
#'
#' @inheritParams ebc_TP
#' @param prop Logical, default to \code{FALSE}. Should the matrix sum to one?
#'
#' @return A 2*2 named matrix.
#' @export
#'
#' @examples
#' ebc_confusion(detected = c("A", "C", "D"), true = c("A", "B", "C"), m = 6)
ebc_confusion <- function(detected, true, all, m = length(all), prop = FALSE){
  detected <- nl2c(detected)
  true <- nl2c(true)
  cm <- matrix(c(ebc_TP(detected, true), ebc_FN(detected, true),
                 ebc_FP(detected, true), ebc_TN(detected, true, m = m)),
               nrow = 2, ncol = 2, byrow = FALSE,
               dimnames = list(c("Detected positive", "Detected negative"),
                               c("Condition positive", "Condition negative"))
    )
  if (prop) {
    return(cm / sum(cm))
  } else {
    return(cm)
  }
}
