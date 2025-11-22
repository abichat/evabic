# Add names to a vector

Add names to a vector, with default names.

## Usage

``` r
add_names(x, names = NULL, prefix = "x")
```

## Arguments

- x:

  A vector.

- names:

  Vector of names to add. If `NULL`, default names are added.

- prefix:

  The prefix to add before default names. Useful only if `names` is set
  to `NULL`.

## Value

A named vector

## Examples

``` r
add_names(month.name)
#>         x01         x02         x03         x04         x05         x06 
#>   "January"  "February"     "March"     "April"       "May"      "June" 
#>         x07         x08         x09         x10         x11         x12 
#>      "July"    "August" "September"   "October"  "November"  "December" 
```
