#' Derived measures.
#'
#' Measures derived from confusion matrix.
#'
#' @param detected Vector of elements that are detected.
#' @param true Vector of element that are supposed to be detected (\eqn{H1}).
#' @param all Vector of all elements.
#' @param m Total number of element.
#' @return A numeric.
#' @export
#'
#' @examples
ebc_TPR <- function(detected, true){
  ebc_TP(detected, true) / length(true)
}

#' @rdname ebc_TPR
#' @export
ebc_TNR <- function(detected, true, all, m = length(all)){
  ebc_TN(detected, true, m = m) / (m - length(true))
}

#' @rdname ebc_TPR
#' @export
ebc_FDR <- function(detected, true){
  ebc_FP(detected, true) / max(length(detected), 1)
}

#' @rdname ebc_TPR
#' @export
ebc_ACC <- function(detected, true, all, m = length(all)){
  (ebc_TP(detected, true) + ebc_TN(detected, true, m = m)) / m
}
