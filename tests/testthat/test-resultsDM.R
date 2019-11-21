context("Results for derived statistics")

elements <- 1:10
total <- length(elements)
detectedH1 <- c(1:4, 8,9)
trueH1 <- 1:5

test_that("derived statistics are correct", {
  expect_equal(ebc_TPR(detectedH1, trueH1), 4 / 5)
  expect_equal(ebc_TNR(detectedH1, trueH1, elements), 3 / 5)
  expect_equal(ebc_TNR(detectedH1, trueH1, m = total), 3 / 5)
  expect_equal(ebc_PPV(detectedH1, trueH1), 2 / 3)
  expect_equal(ebc_NPV(detectedH1, trueH1, elements), 3 / 4)
  expect_equal(ebc_NPV(detectedH1, trueH1, m = total), 3 / 4)
  expect_equal(ebc_FNR(detectedH1, trueH1), 1 / 5)
  expect_equal(ebc_FPR(detectedH1, trueH1, elements), 2 / 5)
  expect_equal(ebc_FPR(detectedH1, trueH1, m = total), 2 / 5)
  expect_equal(ebc_FDR(detectedH1, trueH1), 1 / 3)
  expect_equal(ebc_FOR(detectedH1, trueH1, elements), 1 / 4)
  expect_equal(ebc_FOR(detectedH1, trueH1, m = total), 1 / 4)
  expect_equal(ebc_ACC(detectedH1, trueH1, elements), 7 / 10)
  expect_equal(ebc_ACC(detectedH1, trueH1, m = total), 7 / 10)
  expect_equal(ebc_BACC(detectedH1, trueH1, elements), 7 / 10)
  expect_equal(ebc_BACC(detectedH1, trueH1, m = total), 7 / 10)
  expect_equal(ebc_F1(detectedH1, trueH1), 8 / 11)
  expect_equal(ebc_PLR(detectedH1, trueH1, elements),  2)
  expect_equal(ebc_PLR(detectedH1, trueH1, m = total), 2)
  expect_equal(ebc_NLR(detectedH1, trueH1, elements),  1 / 3)
  expect_equal(ebc_NLR(detectedH1, trueH1, m = total), 1 / 3)
  expect_equal(ebc_DOR(detectedH1, trueH1, elements),  6)
  expect_equal(ebc_DOR(detectedH1, trueH1, m = total), 6)
})


detectedH1 <- sample(letters, 14)
trueH1 <- sample(letters, 15)

test_that("relations between statistics are correct", {
  expect_equal(ebc_TPR(detectedH1, trueH1),
               1 - ebc_FNR(detectedH1, trueH1))
  expect_equal(ebc_TNR(detectedH1, trueH1, letters),
               1 - ebc_FPR(detectedH1, trueH1, letters))
  expect_equal(ebc_PPV(detectedH1, trueH1),
               1 - ebc_FDR(detectedH1, trueH1))
  expect_equal(ebc_NPV(detectedH1, trueH1, letters),
               1 - ebc_FOR(detectedH1, trueH1, letters))
  expect_equal(ebc_F1(detectedH1, trueH1),
               2 / ((1 / ebc_TPR(detectedH1, trueH1)) +
                      1 / ebc_PPV(detectedH1, trueH1)))
  expect_equal(ebc_DOR(detectedH1, trueH1, letters),
               ebc_PLR(detectedH1, trueH1, letters) /
                 ebc_NLR(detectedH1, trueH1, letters))
})
