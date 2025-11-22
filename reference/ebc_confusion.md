# Confusion matrix

Compute the the confusion matrix

## Usage

``` r
ebc_confusion(detected, true, all, m = length(all), prop = FALSE)
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

- prop:

  Logical, default to `FALSE`. Should the matrix sum to one?

## Value

A 2\*2 named matrix.

## Details

See
[`ebc_allmeasures`](https://abichat.github.io/evabic/reference/ebc_allmeasures.md)
for the description of the measures.

## Examples

``` r
ebc_confusion(detected = c("A", "C", "D"), true = c("A", "B", "C"), m = 6)
#>                   Condition positive Condition negative
#> Detected positive                  2                  1
#> Detected negative                  1                  2
```
