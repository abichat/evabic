#' Confusion measures.
#'
#' Basic measures from the confusion matrix.
#'
#' @param detected Vector of elements that are detected.
#' @param true Vector of element that are supposed to be detected (\eqn{H1}).
#' @param all Vector of all elements.
#' @param m Total number of element.
#' @return An integer.
#' @export
#'
#' @examples
#' ebc_TP(detected = c("A", "C", "D"), true = c("A", "B", "C"))
#' ebc_FP(detected = c("A", "C", "D"), true = c("A", "B", "C"))
#' ebc_FN(detected = c("A", "C", "D"), true = c("A", "B", "C"))
#' ebc_TN(detected = c("A", "C", "D"), true = c("A", "B", "C"),
#'        all = LETTERS[1:6])
#' ebc_TN(detected = c("A", "C", "D"), true = c("A", "B", "C"),
#'        m = 6)
ebc_TP <- function(detected, true){
  length(intersect(detected, true))
}

#' @rdname ebc_TP
#' @export
ebc_FP <- function(detected, true){
  length(setdiff(detected, true))
}

#' @rdname ebc_TP
#' @export
ebc_FN <- function(detected, true){
  length(setdiff(true, detected))
}

#' @rdname ebc_TP
#' @export
ebc_TN <- function(detected, true, all, m = length(all)){
  m - length(union(detected, true))
}

#' @rdname ebc_TP
#' @export
ebc_P <- function(true){
  length(true)
}

#' @rdname ebc_TP
#' @export
ebc_N <- function(true, all, m = length(all)){
  m - length(true)
}
