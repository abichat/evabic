#' Tidy output for measures
#'
#' Construct a single row summary of the classifier.
#'
#' See \code{\link{ebc_allmeasures}} for the available measures and
#' their descriptions.
#'
#' @inheritParams ebc_TP
#' @param measures Desired measures of performance.
#'
#' @return A single-row data.frame with one column per
#' element in \code{measures}.
#' @export
#'
#' @seealso \code{\link{ebc_TP}}, \code{\link{ebc_TPR}},
#' \code{\link{ebc_allmeasures}}
#'
#' @examples
#' ebc_tidy(detected = c("A", "C", "D"), true = c("A", "B", "C"),
#'          all = LETTERS[1:6], measures = c("ACC", "FDR"))
ebc_tidy <- function(detected, true, all, m = length(all),
                     measures = c("TPR", "FPR", "FDR", "ACC", "F1")){

  if(length(setdiff(measures, ebc_allmeasures)) > 0){
    warning("Some measure are not available, they won't be used.")
  }

  detected <- nl2c(detected)
  true <- nl2c(true)

  measures <- intersect(measures, ebc_allmeasures)

  df <- data.frame(row.names = 1)

  if ("TP"   %in% measures) df$TP   <- ebc_TP(detected, true)
  if ("FP"   %in% measures) df$FP   <- ebc_FP(detected, true)
  if ("FN"   %in% measures) df$FN   <- ebc_FN(detected, true)
  if ("TN"   %in% measures) df$TN   <- ebc_TN(detected, true, m = m)
  if ("TPR"  %in% measures) df$TPR  <- ebc_TPR(detected, true)
  if ("TNR"  %in% measures) df$TNR  <- ebc_TNR(detected, true, m = m)
  if ("PPV"  %in% measures) df$PPV  <- ebc_PPV(detected, true)
  if ("NPV"  %in% measures) df$NPV  <- ebc_NPV(detected, true, m = m)
  if ("FNR"  %in% measures) df$FNR  <- ebc_FNR(detected, true)
  if ("FPR"  %in% measures) df$FPR  <- ebc_FPR(detected, true, m = m)
  if ("FDR"  %in% measures) df$FDR  <- ebc_FDR(detected, true)
  if ("FOR"  %in% measures) df$FOR  <- ebc_FOR(detected, true, m = m)
  if ("ACC"  %in% measures) df$ACC  <- ebc_ACC(detected, true, m = m)
  if ("BACC" %in% measures) df$BACC <- ebc_BACC(detected, true, m = m)
  if ("F1"   %in% measures) df$F1   <- ebc_F1(detected, true)
  if ("PLR"  %in% measures) df$PLR  <- ebc_PLR(detected, true, m = m)
  if ("NLR"  %in% measures) df$NLR  <- ebc_NLR(detected, true, m = m)
  if ("DOR"  %in% measures) df$DOR  <- ebc_DOR(detected, true, m = m)

  df[, measures]
}
