
<!-- README.md is generated from README.Rmd. Please edit that file -->

# evabic

<!-- badges: start -->

[![license](https://img.shields.io/badge/license-GPL--3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0.en.html)
[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![packageversion](https://img.shields.io/badge/Package%20version-0.0.0.9001-orange.svg?style=flat-square)](commits/master)
[![Last-changedate](https://img.shields.io/badge/last%20change-2019--04--16-yellowgreen.svg)](/commits/master)
<!-- badges: end -->

The goal of evabic is to provide handy functions to evaluate binary
classifiers.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("abichat/evabic")
```

## Example

Suppose that you are testing 10 conditions: `A, B, C, D, E, F, G, H, I,
& J`.

Conditions `A` to `E` are in H0 and conditions `F` to `J` are in H1.

Your model detect `D` and `G` to `I` in H1.

``` r
conditions <- LETTERS[1:10]
trueH1 <- LETTERS[6:10]
detectedH1 <- c("D", LETTERS[7:9])
```

``` r
library(evabic)
```

``` r
ebc_TP(detectedH1, trueH1)
#> [1] 3
ebc_TPR(detectedH1, trueH1)
#> [1] 0.6
ebc_ACC(detectedH1, trueH1, all = conditions)
#> [1] 0.7
```

``` r
ebc_tidy(detectedH1, trueH1, m = 10, measures = c("ACC", "TPR", "FDR", "F1"))
#>   ACC TPR  FDR        F1
#> 1 0.7 0.6 0.25 0.6666667
```
