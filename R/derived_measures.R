#' Derived measures.
#'
#' Measures derived from confusion matrix.
#'
#' See \code{\link{ebc_allmeasures}} for the description of the measures.
#'
#' @inheritParams ebc_TP
#' @return A numeric.
#' @export
#'
#' @seealso \code{\link{ebc_TP}}, \code{\link{ebc_tidy}},
#'  \code{\link{ebc_allmeasures}}
#'
#' @examples
#' ebc_TPR(detected = c("A", "C", "D"), true = c("A", "B", "C"))
#' ebc_ACC(detected = c("A", "C", "D"), true = c("A", "B", "C"),
#'         all = LETTERS[1:5])
ebc_TPR <- function(detected, true){
  detected <- nl2c(detected)
  true <- nl2c(true)
  ebc_TP(detected, true) / length(true)
}

#' @rdname ebc_TPR
#' @export
ebc_TNR <- function(detected, true, all, m = length(all)){
  detected <- nl2c(detected)
  true <- nl2c(true)
  ebc_TN(detected, true, m = m) / (m - length(true))
}

#' @rdname ebc_TPR
#' @export
ebc_PPV <- function(detected, true){
  detected <- nl2c(detected)
  true <- nl2c(true)
  ebc_TP(detected, true) / (ebc_TP(detected, true) + ebc_FP(detected, true))
}

#' @rdname ebc_TPR
#' @export
ebc_NPV <- function(detected, true, all, m = length(all)){
  detected <- nl2c(detected)
  true <- nl2c(true)
  ebc_TN(detected, true, m = m) / (m - length(detected))
}

#' @rdname ebc_TPR
#' @export
ebc_FNR <- function(detected, true){
  detected <- nl2c(detected)
  true <- nl2c(true)
  ebc_FN(detected, true) / length(true)
}

#' @rdname ebc_TPR
#' @export
ebc_FPR <- function(detected, true, all, m = length(all)){
  detected <- nl2c(detected)
  true <- nl2c(true)
  ebc_FP(detected, true) / (m - length(true))
}

#' @rdname ebc_TPR
#' @export
ebc_FDR <- function(detected, true){
  detected <- nl2c(detected)
  true <- nl2c(true)
  ebc_FP(detected, true) / length(detected)
}

#' @rdname ebc_TPR
#' @export
ebc_FOR <- function(detected, true, all, m = length(all)){
  detected <- nl2c(detected)
  true <- nl2c(true)
  ebc_FN(detected, true) / (m - length(detected))
}

#' @rdname ebc_TPR
#' @export
ebc_ACC <- function(detected, true, all, m = length(all)){
  detected <- nl2c(detected)
  true <- nl2c(true)
  (ebc_TP(detected, true) + ebc_TN(detected, true, m = m)) / m
}

#' @rdname ebc_TPR
#' @export
ebc_BACC <- function(detected, true, all, m = length(all)){
  detected <- nl2c(detected)
  true <- nl2c(true)
  (ebc_TP(detected, true) / length(true) +
     ebc_TN(detected, true, m = m) / (m - length(true))) / 2
}

#' @rdname ebc_TPR
#' @export
ebc_F1 <- function(detected, true){
  detected <- nl2c(detected)
  true <- nl2c(true)
  2 * ebc_TP(detected, true) /
    (2*ebc_TP(detected, true) + ebc_FP(detected, true) + ebc_FN(detected, true))
}

#' @rdname ebc_TPR
#' @export
ebc_PLR <- function(detected, true, all, m = length(all)){
  detected <- nl2c(detected)
  true <- nl2c(true)
  ebc_TPR(detected, true) / (1 - ebc_TNR(detected, true, m = m))
}

#' @rdname ebc_TPR
#' @export
ebc_NLR <- function(detected, true, all, m = length(all)){
  detected <- nl2c(detected)
  true <- nl2c(true)
  (1 - ebc_TPR(detected, true)) / ebc_TNR(detected, true, m = m)
}

#' @rdname ebc_TPR
#' @export
ebc_DOR <- function(detected, true, all, m = length(all)){
  detected <- nl2c(detected)
  true <- nl2c(true)
  (ebc_TP(detected, true) / ebc_FP(detected, true)) /
    (ebc_FN(detected, true) / ebc_TN(detected, true, m = m))
}
