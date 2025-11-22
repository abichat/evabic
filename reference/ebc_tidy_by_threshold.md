# Measures by threshold

Computes measures according to a moving threshold.

## Usage

``` r
ebc_tidy_by_threshold(
  detection_values,
  true,
  all,
  m = length(all),
  measures = c("TPR", "FPR", "FDR", "ACC", "F1"),
  direction = c("<", ">", "<=", ">=")
)
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

- measures:

  Desired measures of performance.

- direction:

  With `<` (default), detected elements are those which are strictly
  less than the threshold. Could be change to `">"`, `<=` or `>=`.

## Value

A dataframe with one column called threshold and other corresponding to
those specified in `measures`.

## Details

See
[`ebc_allmeasures`](https://abichat.github.io/evabic/reference/ebc_allmeasures.md)
for the available measures and their descriptions.

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
ebc_tidy_by_threshold(pvalues, predictors, m = 7)
#>     threshold       TPR  FPR       FDR       ACC        F1
#> 1 0.003469737 0.0000000 0.00       NaN 0.5714286 0.0000000
#> 2 0.004366456 0.3333333 0.00 0.0000000 0.7142857 0.5000000
#> 3 0.173677616 0.6666667 0.00 0.0000000 0.8571429 0.8000000
#> 4 0.449664443 1.0000000 0.00 0.0000000 1.0000000 1.0000000
#> 5 0.491828466 1.0000000 0.25 0.2500000 0.8571429 0.8571429
#> 6 0.581608670 1.0000000 0.50 0.4000000 0.7142857 0.7500000
#> 7 0.887948400 1.0000000 0.75 0.5000000 0.5714286 0.6666667
#> 8         Inf 1.0000000 1.00 0.5714286 0.4285714 0.6000000
```
