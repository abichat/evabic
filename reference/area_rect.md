# Area Under the Curve

Compute area under the curve by using the rectangle's method.

## Usage

``` r
area_rect(x, y)
```

## Arguments

- x:

  Numeric.

- y:

  Numeric.

## Value

A numeric.

## Examples

``` r
x <- c(0, 0, 0.5, 1)
y <- c(0, 0.5, 0.5, 1)
plot(x, y, type = "b")

evabic:::area_rect(x, y)
#> [1] 0.625
```
