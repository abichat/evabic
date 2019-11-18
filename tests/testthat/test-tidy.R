context("Format of ebc_tidy")

elements <- 1:10
detectedH1 <- c(1:4, 8,9)
trueH1 <- 1:5

measures_wo_m <- c("TP", "FP", "FN", "TPR", "PPV", "FNR", "FDR", "F1")

test_that("ebc_tidy() has the correct format", {
  expect_is(ebc_tidy(detectedH1, trueH1, elements), "data.frame")
  expect_equal(nrow(ebc_tidy(detectedH1, trueH1, elements)), 1)
  expect_equal(ncol(ebc_tidy(detectedH1, trueH1, elements,
                             measures = c("ACC", "FDR"))), 2)
  expect_equal(ncol(ebc_tidy(detectedH1, trueH1, elements,
                             measures = ebc_allmeasures)),
               length(ebc_allmeasures))
  expect_equal(colnames(ebc_tidy(detectedH1, trueH1, elements,
                                 measures = c("TN", "F1", "TPR"))),
               c("TN", "F1", "TPR"))
})

test_that("arguments are correct", {
  expect_is(ebc_tidy(detectedH1, trueH1, measures = measures_wo_m),
            "data.frame")
  expect_error(ebc_tidy(detectedH1, trueH1, measures = c("TN", "ACC")))
})


test_that("checking mesaures works", {
  expect_warning(ebc_tidy(detectedH1, trueH1, elements,
                          measures = c("TN", "ZZ", "TPR")))
  expect_equal(
    ncol(suppressWarnings(ebc_tidy(detectedH1, trueH1,
                                   elements,measures = c("TN", "ZZ", "F1")))),
    2)
})


detectedH1_lgl <- elements %in% detectedH1
names(detectedH1_lgl) <- elements
trueH1_lgl <- elements %in% trueH1
names(trueH1_lgl) <- elements

test_that("All measures works with logical", {
  expect_equal(ebc_tidy(detectedH1, trueH1, all = elements,
                        measures = ebc_allmeasures),
               ebc_tidy(detectedH1_lgl, trueH1_lgl, m = 10,
                        measures = ebc_allmeasures))
})
