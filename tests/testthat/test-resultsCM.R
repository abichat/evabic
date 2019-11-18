context("Results for confusion matrix statistics")


elements <- 1:10
total <- length(elements)
detectedH1 <- c(1:4, 8,9)
trueH1 <- 1:5

test_that("confusion matrix is correct for numeric", {
  expect_equal(ebc_TP(detectedH1, trueH1), 4)
  expect_equal(ebc_FP(detectedH1, trueH1), 2)
  expect_equal(ebc_FN(detectedH1, trueH1), 1)
  expect_equal(ebc_TN(detectedH1, trueH1, elements), 3)
  expect_equal(ebc_TN(detectedH1, trueH1, m = total), 3)
})

elements_str <- letters[elements]
detectedH1_str <- letters[detectedH1]
trueH1_str <- letters[trueH1]

test_that("confusion matrix is correct for characters", {
  expect_equal(ebc_TP(detectedH1_str, trueH1_str), 4)
  expect_equal(ebc_FP(detectedH1_str, trueH1_str), 2)
  expect_equal(ebc_FN(detectedH1_str, trueH1_str), 1)
  expect_equal(ebc_TN(detectedH1_str, trueH1_str, elements_str), 3)
  expect_equal(ebc_TN(detectedH1_str, trueH1_str, m = total), 3)
})

elements_fct <- as.factor(elements_str)
detectedH1_fct <- as.factor(detectedH1_str)
trueH1_fct <- as.factor(trueH1_str)

test_that("confusion matrix is correct for factors", {
  expect_equal(ebc_TP(detectedH1_fct, trueH1_fct), 4)
  expect_equal(ebc_FP(detectedH1_fct, trueH1_fct), 2)
  expect_equal(ebc_FN(detectedH1_fct, trueH1_fct), 1)
  expect_equal(ebc_TN(detectedH1_fct, trueH1_fct, elements_fct), 3)
  expect_equal(ebc_TN(detectedH1_fct, trueH1_fct, m = total), 3)
})

detectedH1_lgl <- elements_str %in% detectedH1_str
names(detectedH1_lgl) <- elements_str
trueH1_lgl <- elements_str %in% trueH1_str
names(trueH1_lgl) <- elements_str


test_that("confusion matrix is correct for logicals", {
  expect_equal(ebc_TP(detectedH1_lgl, trueH1_lgl), 4)
  expect_equal(ebc_FP(detectedH1_lgl, trueH1_lgl), 2)
  expect_equal(ebc_FN(detectedH1_lgl, trueH1_lgl), 1)
  expect_equal(ebc_TN(detectedH1_lgl, trueH1_lgl, elements_str), 3)
  expect_equal(ebc_TN(detectedH1_lgl, trueH1_lgl, m = total), 3)
})

test_that("confusion matrix is correct for mixed types", {
  expect_equal(ebc_TP(detectedH1_lgl, trueH1_fct), 4)
  expect_equal(ebc_FP(detectedH1_str, trueH1_lgl), 2)
  expect_equal(ebc_FN(detectedH1_str, trueH1_fct), 1)
  expect_equal(ebc_TN(detectedH1_fct, trueH1_lgl, elements_str), 3)
  expect_equal(ebc_TN(detectedH1_fct, trueH1_str, m = total), 3)
})



