# Derived measures.

Measures derived from confusion matrix.

## Usage

``` r
ebc_TPR(detected, true)

ebc_TNR(detected, true, all, m = length(all))

ebc_PPV(detected, true)

ebc_NPV(detected, true, all, m = length(all))

ebc_FNR(detected, true)

ebc_FPR(detected, true, all, m = length(all))

ebc_FDR(detected, true)

ebc_FOR(detected, true, all, m = length(all))

ebc_ACC(detected, true, all, m = length(all))

ebc_BACC(detected, true, all, m = length(all))

ebc_F1(detected, true)

ebc_PLR(detected, true, all, m = length(all))

ebc_NLR(detected, true, all, m = length(all))

ebc_DOR(detected, true, all, m = length(all))
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

A numeric.

## Details

See
[`ebc_allmeasures`](https://abichat.github.io/evabic/reference/ebc_allmeasures.md)
for the description of the measures.

## See also

[`ebc_TP`](https://abichat.github.io/evabic/reference/ebc_TP.md),
[`ebc_tidy`](https://abichat.github.io/evabic/reference/ebc_tidy.md),
[`ebc_allmeasures`](https://abichat.github.io/evabic/reference/ebc_allmeasures.md)

## Examples

``` r
ebc_TPR(detected = c("A", "C", "D"), true = c("A", "B", "C"))
#> [1] 0.6666667
ebc_ACC(detected = c("A", "C", "D"), true = c("A", "B", "C"),
        all = LETTERS[1:5])
#> [1] 0.6
```
