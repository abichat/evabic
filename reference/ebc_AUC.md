# Area under the curve

Compute the Area Under the Curve for a classification.

## Usage

``` r
ebc_AUC(
  detection_values,
  true,
  all,
  m = length(all),
  direction = c("<", ">", "<=", ">=")
)

ebc_AUC_from_measures(df_measures)
```

## Arguments

- detection_values:

  Values corresponding to elements that are detected. Must be named.

- true:

  Vector of element that are supposed to be detected.

- all:

  Vector of all elements.

- m:

  Total number of elements.

- direction:

  With `<` (default), detected elements are those which are strictly
  less than the threshold. Could be change to `">"`, `<=` or `>=`.

- df_measures:

  A dataframe with `TPR` and `FRP` columns. E.g. the output of
  [`ebc_tidy_by_threshold`](https://abichat.github.io/evabic/reference/ebc_tidy_by_threshold.md).

## Value

A numeric.

## Examples

``` r
set.seed(42)
X1 <- rnorm(50)
X2 <- rnorm(50)
X3 <- rnorm(50)
predictors <- paste0("X", 1:3)
df_lm <- data.frame(X1 = X1, X2 = X2, X3 = X3,
                    X4 = X1 + X2 + X3 + rnorm(50, sd = 0.5),
                    X5 = X1 + 3 * X3 + rnorm(50, sd = 0.5),
                    X6 = X2 - 2 * X3 + rnorm(50, sd = 0.5),
                    X7 = X1 - X2 + rnorm(50, sd = 2),
                    Y  = X1 - X2 + 3 * X3 + rnorm(50))
model <- lm(Y ~ ., data = df_lm)
pvalues <- summary(model)$coefficients[-1, 4]
ebc_AUC(pvalues, predictors, m = 7)
#> [1] 1

df_measures <- ebc_tidy_by_threshold(pvalues, predictors, m = 7)
ebc_AUC_from_measures(df_measures)
#> [1] 1
```
