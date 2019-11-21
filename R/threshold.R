#' Measures by threshold
#'
#' Computes measures according to a moving threshold.
#'
#' See \code{\link{ebc_allmeasures}} for the available measures and
#' their descriptions.
#'
#' @param detection_values Values corresponding to elements that are detected.
#' Must be named.
#' @inheritParams ebc_tidy
#' @param direction With \code{<} (default), detected elements are those
#' which are strictly less than the threshold. Could be change to \code{">"},
#' \code{<=} or \code{>=}.
#'
#' @return A dataframe with one column called threshold and other corresponding
#' to those specified in \code{measures}.
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
#' ebc_tidy_by_threshold(pvalues, predictors, m = 7)
ebc_tidy_by_threshold <- function(detection_values, true, all,
                          m = length(all),
                          measures = c("TPR", "FPR", "FDR", "ACC", "F1"),
                          direction = c("<", ">", "<=", ">=")) {

  direction <- match.arg(direction)
  thresholds <- unname(sort(unique(detection_values)))

  if (direction == "<") {
    thresholds <- c(thresholds, +Inf)
    list_logical <- lapply(thresholds, function(x) detection_values < x)
  } else if (direction == ">") {
    thresholds <- c(-Inf, thresholds)
    list_logical <- lapply(thresholds, function(x) detection_values > x)
  } else if (direction == "<=") {
    thresholds <- c(-Inf, thresholds)
    list_logical <- lapply(thresholds, function(x) detection_values <= x)
  } else if (direction == ">=") {
    thresholds <- c(thresholds, +Inf)
    list_logical <- lapply(thresholds, function(x) detection_values >= x)
  }

  list_measures <- lapply(list_logical, ebc_tidy, true = true,
                          m = m, measures = measures)

  df_measures <- Reduce(rbind, list_measures)
  df_measures <- cbind(data.frame(threshold = thresholds), df_measures)
  rownames(df_measures) <- NULL

  return(df_measures)
}
