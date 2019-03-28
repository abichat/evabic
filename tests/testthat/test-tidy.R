context("Format of ebc_tidy")

elements <- 1:10
detectedH1 <- c(1:4, 8,9)
trueH1 <- 1:5

all_measures <- c("TP", "FP", "FN", "TN", "TPR",
                  "TNR", "PPV", "FDR", "ACC", "F1")

measures_wo_m <- c("TP", "FP", "FN", "TPR", "PPV", "FDR", "F1")

test_that("ebc_tidy() has the correct format", {
  expect_is(ebc_tidy(detectedH1, trueH1, elements), "data.frame")
  expect_equal(1, nrow(ebc_tidy(detectedH1, trueH1, elements)))
  expect_equal(2, ncol(ebc_tidy(detectedH1, trueH1, elements,
                                measures = c("ACC", "FDR"))))
  expect_equal(10, ncol(ebc_tidy(detectedH1, trueH1, elements,
                                measures = all_measures)))
  expect_equal(c("TN", "F1", "TPR"),
               colnames(ebc_tidy(detectedH1, trueH1, elements,
                                 measures = c("TN", "F1", "TPR"))))
})

test_that("arguments are correct", {
  expect_is(ebc_tidy(detectedH1, trueH1, measures = measures_wo_m),
            "data.frame")
  expect_error(ebc_tidy(detectedH1, trueH1, measures = c("TN", "ACC")))
})

