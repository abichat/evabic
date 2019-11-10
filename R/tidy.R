#' Tidy output for confusion measures
#'
#' Construct a single row summary of the classifier.
#'
#' Supported measures are \code{c("TP", "FP", "FN",
#' "TN", "TPR", "TNR", "PPV", "FDR", "ACC", "BACC", "F1")}
#' @param detected Vector of elements that are detected.
#' @param true Vector of element that are supposed to be detected (\eqn{H1}).
#' @param all Vector of all elements.
#' @param m Total number of element.
#' @param measures Desired measures of performance.
#'
#' @return A single-row data.frame with one column per
#' element in \code{measures}.
#' @export
#'
#' @examples
#' ebc_tidy(detected = c("A", "C", "D"), true = c("A", "B", "C"),
#'          all = LETTERS[1:6], measures = c("ACC", "FDR"))
ebc_tidy <- function(detected, true, all, m = length(all),
                     measures = c("TPR", "FDR", "ACC", "F1")){
  ebc_allmeasures <- c("TP", "FP", "FN", "TN", "TPR", "TNR",
                       "PPV", "FDR", "ACC", "BACC", "F1")

  if(length(setdiff(measures, ebc_allmeasures)) > 0){
    warning("Some measure are not available, they won't be used.")
  }

  measures <- intersect(measures, ebc_allmeasures)

  df <- data.frame(row.names = 1)

  if ("TP"  %in% measures) df$TP  <- ebc_TP(detected, true)
  if ("FP"  %in% measures) df$FP  <- ebc_FP(detected, true)
  if ("FN"  %in% measures) df$FN  <- ebc_FN(detected, true)
  if ("TN"  %in% measures) df$TN  <- ebc_TN(detected, true, m = m)
  if ("TPR" %in% measures) df$TPR <- ebc_TPR(detected, true)
  if ("TNR" %in% measures) df$TNR <- ebc_TNR(detected, true, m = m)
  if ("PPV" %in% measures) df$PPV <- ebc_PPV(detected, true)
  if ("FDR" %in% measures) df$FDR <- ebc_FDR(detected, true)
  if ("ACC" %in% measures) df$ACC <- ebc_ACC(detected, true, m = m)
  if ("BACC" %in% measures) df$BACC <- ebc_BACC(detected, true, m = m)
  if ("F1"  %in% measures) df$F1  <- ebc_F1(detected, true)

  df[, measures]
}
