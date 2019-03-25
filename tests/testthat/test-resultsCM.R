context("Results for confusion matrix statistics")


elements <- 1:10
detectedH1 <- c(1:4, 8,9)
trueH1 <- 1:5

test_that("confusion matrix is correct for numeric", {
  expect_equal(ebc_TP(detectedH1, trueH1), 4)
  expect_equal(ebc_FP(detectedH1, trueH1), 2)
  expect_equal(ebc_FN(detectedH1, trueH1), 1)
  expect_equal(ebc_TN(detectedH1, trueH1, elements), 3)
  expect_equal(ebc_TN(detectedH1, trueH1, m = 10), 3)
})

elements_str <- letters[elements]
detectedH1_str <- letters[detectedH1]
trueH1_str <- letters[trueH1]

test_that("confusion matrix is correct for characters", {
  expect_equal(ebc_TP(detectedH1_str, trueH1_str), 4)
  expect_equal(ebc_FP(detectedH1_str, trueH1_str), 2)
  expect_equal(ebc_FN(detectedH1_str, trueH1_str), 1)
  expect_equal(ebc_TN(detectedH1_str, trueH1_str, elements_str), 3)
  expect_equal(ebc_TN(detectedH1_str, trueH1_str, m = 10), 3)
})
