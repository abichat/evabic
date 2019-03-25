context("Results for derived statistics")

elements <- 1:10
detectedH1 <- c(1:4, 8,9)
trueH1 <- 1:5

test_that("derived statistics are correct", {
  expect_equal(ebc_TPR(detectedH1, trueH1), 4/5)
  expect_equal(ebc_TNR(detectedH1, trueH1, elements), 3/5)
  expect_equal(ebc_TNR(detectedH1, trueH1, m = 10), 3/5)
  expect_equal(ebc_FDR(detectedH1, trueH1), 1/3)
  expect_equal(ebc_ACC(detectedH1, trueH1, elements), 7/10)
  expect_equal(ebc_ACC(detectedH1, trueH1, m = 10), 7/10)
  expect_equal(ebc_PPV(detectedH1, trueH1), 2/3)
  expect_equal(ebc_F1(detectedH1, trueH1), 8/11)
})
