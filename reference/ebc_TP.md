# Confusion measures.

Basic measures from the confusion matrix.

## Usage

``` r
ebc_TP(detected, true)

ebc_FP(detected, true)

ebc_FN(detected, true)

ebc_TN(detected, true, all, m = length(all))
```

## Arguments

- detected:

  Vector of elements that are detected.

- true:

  Vector of element that are supposed to be detected.

- all:

  Vector of all elements.

- m:

  Total number of elements.

## Value

An integer.

## Details

See
[`ebc_allmeasures`](https://abichat.github.io/evabic/reference/ebc_allmeasures.md)
for the description of the measures.

## See also

[`ebc_TPR`](https://abichat.github.io/evabic/reference/ebc_TPR.md),
[`ebc_tidy`](https://abichat.github.io/evabic/reference/ebc_tidy.md),
[`ebc_allmeasures`](https://abichat.github.io/evabic/reference/ebc_allmeasures.md)

## Examples

``` r
ebc_TP(detected = c("A", "C", "D"), true = c("A", "B", "C"))
#> [1] 2
ebc_FP(detected = c("A", "C", "D"), true = c("A", "B", "C"))
#> [1] 1
ebc_FN(detected = c("A", "C", "D"), true = c("A", "B", "C"))
#> [1] 1
ebc_TN(detected = c("A", "C", "D"), true = c("A", "B", "C"),
       all = LETTERS[1:6])
#> [1] 2
ebc_TN(detected = c("A", "C", "D"), true = c("A", "B", "C"), m = 6)
#> [1] 2
```
