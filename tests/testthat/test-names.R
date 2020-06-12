context("Names")

x <- runif(200)
y <- x < 0.05
z <- add_names(y)

test_that("nl2c errors when there is no name", {
  expect_error(nl2c(y))
})

test_that("nl2c is correct", {
  n <- nl2c(z)
  expect_equal(length(n), sum(y))
  expect_true(all(n %in% names(z)))
})

test_that("adding names works", {
  expect_equal(unname(z), y)
  expect_equal(nchar(names(z)), rep(nchar(names(z)[1]), length(y)))
  expect_equal(sort(names(z)), names(z))
})

