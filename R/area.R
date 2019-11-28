#' Area Under the Curve
#'
#' Compute area under the curve by using the rectangle's method.
#'
#' @param  x Numeric.
#' @param  y Numeric.
#'
#' @return A numeric.
#'
#' @examples
#' x <- c(0, 0, 0.5, 1)
#' y <- c(0, 0.5, 0.5, 1)
#' plot(x, y, type = "b")
#' evabic:::area_rect(x, y)
area_rect <- function(x, y) {
  stopifnot(length(x) == length(y))
  n <- length(x)
  sum(diff(x) * (y[-1] + y[-n])) / 2
}


#' Area under the curve
#'
#' Compute the Area Under the Curve for a classification.
#'
#' @inheritParams ebc_tidy_by_threshold
#'
#' @return A numeric.
#' @export
#'
#' @examples
#' set.seed(42)
#' X1 <- rnorm(50)
#' X2 <- rnorm(50)
#' X3 <- rnorm(50)
#' predictors <- paste0("X", 1:3)
#' df_lm <- data.frame(X1 = X1, X2 = X2, X3 = X3,
#'                     X4 = X1 + X2 + X3 + rnorm(50, sd = 0.5),
#'                     X5 = X1 + 3 * X3 + rnorm(50, sd = 0.5),
#'                     X6 = X2 - 2 * X3 + rnorm(50, sd = 0.5),
#'                     X7 = X1 - X2 + rnorm(50, sd = 2),
#'                     Y  = X1 - X2 + 3 * X3 + rnorm(50))
#' model <- lm(Y ~ ., data = df_lm)
#' pvalues <- summary(model)$coefficients[-1, 4]
#' ebc_AUC(pvalues, predictors, m = 7)
ebc_AUC <- function(detection_values, true, all, m = length(all),
                    direction = c("<", ">", "<=", ">=")) {
  direction <- match.arg(direction)
  df_roc <- ebc_tidy_by_threshold(detection_values, true, m = m,
                                  measures = c("TPR", "FPR"),
                                  direction = direction)
  df_roc <- df_roc[order(df_roc$TPR), ]
  df_roc <- df_roc[order(df_roc$FPR), ]
  area_rect(df_roc$FPR, df_roc$TPR)
}

