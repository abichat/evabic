# Tidy output for measures

Construct a single row summary of the classifier.

## Usage

``` r
ebc_tidy(
  detected,
  true,
  all,
  m = length(all),
  measures = c("TPR", "FPR", "FDR", "ACC", "F1")
)
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

- measures:

  Desired measures of performance.

## Value

A single-row data.frame with one column per element in `measures`.

## Details

See
[`ebc_allmeasures`](https://abichat.github.io/evabic/reference/ebc_allmeasures.md)
for the available measures and their descriptions.

## See also

[`ebc_TP`](https://abichat.github.io/evabic/reference/ebc_TP.md),
[`ebc_TPR`](https://abichat.github.io/evabic/reference/ebc_TPR.md),
[`ebc_allmeasures`](https://abichat.github.io/evabic/reference/ebc_allmeasures.md)

## Examples

``` r
ebc_tidy(detected = c("A", "C", "D"), true = c("A", "B", "C"),
         all = LETTERS[1:6], measures = c("ACC", "FDR"))
#>         ACC       FDR
#> 1 0.6666667 0.3333333
```
