# Named logical to character

Extracts names of `x` where `x` is `TRUE`

## Usage

``` r
nl2c(x)
```

## Arguments

- x:

  vector

## Value

a vector of the same size

## Examples

``` r
x <- c(a = TRUE, b = FALSE, c = FALSE, d = TRUE)
evabic:::nl2c(x)
#> [1] "a" "d"
```
