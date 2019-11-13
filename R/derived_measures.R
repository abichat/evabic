#' Derived measures.
#'
#' Measures derived from confusion matrix.
#'
#' TPR: True Positive Rate, also known as Sensitivity and Recall.
#'
#' TNR: True Negative Rate, also known as Specificity and Selectivity.
#'
#' PPV: Positive Predictive Value, also known as Precision.
#'
#' FDR: False Discovery Rate.
#'
#' ACC: Accuracy.
#'
#' BACC: Balanced Accuracy.
#'
#' F1: F1 score.
#'
#' @param detected Vector of elements that are detected.
#' @param true Vector of element that are supposed to be detected (\eqn{H1}).
#' @param all Vector of all elements.
#' @param m Total number of element.
#' @return A numeric.
#' @export
#'
#' @examples
#' ebc_TPR(detected = c("A", "C", "D"), true = c("A", "B", "C"))
#' ebc_ACC(detected = c("A", "C", "D"), true = c("A", "B", "C"),
#'         all = LETTERS[1:6])
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
ebc_PPV <- function(detected, true){
  ebc_TP(detected, true) / (ebc_TP(detected, true) + ebc_FP(detected, true))
}

#' @rdname ebc_TPR
#' @export
ebc_NPV <- function(detected, true, all, m = length(all)){
  ebc_TN(detected, true, m = m) / (m - length(detected))
}

#' @rdname ebc_TPR
#' @export
ebc_FNR <- function(detected, true){
  ebc_FN(detected, true) / length(true)
}

#' @rdname ebc_TPR
#' @export
ebc_FPR <- function(detected, true, all, m = length(all)){
  ebc_FP(detected, true) / (m - length(true))
}

#' @rdname ebc_TPR
#' @export
ebc_FDR <- function(detected, true){
  ebc_FP(detected, true) / max(length(detected), 1)
}

#' @rdname ebc_TPR
#' @export
ebc_FOR <- function(detected, true, all, m = length(all)){
  ebc_FN(detected, true) / (m - length(detected))
}

#' @rdname ebc_TPR
#' @export
ebc_ACC <- function(detected, true, all, m = length(all)){
  (ebc_TP(detected, true) + ebc_TN(detected, true, m = m)) / m
}

#' @rdname ebc_TPR
#' @export
ebc_BACC <- function(detected, true, all, m = length(all)){
  (ebc_TP(detected, true) / length(true) +
     ebc_TN(detected, true, m = m) / (m - length(true))) / 2
}

#' @rdname ebc_TPR
#' @export
ebc_F1 <- function(detected, true){
  2 * ebc_TP(detected, true) /
    (2*ebc_TP(detected, true) + ebc_FP(detected, true) + ebc_FN(detected, true))
}

