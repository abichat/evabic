context("Names")

x <- rnorm(200)
y <- add_names(x)

test_that("adding names works", {
  expect_equal(unname(y), x)
  expect_equal(nchar(names(y)), rep(nchar(names(y)[1]), length(x)))
  expect_equal(sort(names(y)), names(y))
})
