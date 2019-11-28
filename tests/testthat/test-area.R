context("Area under the curve")

test_that("rectangle's method works",{
  expect_equal(area_rect(x = c(0, rep(0, 4), 0, sort(runif(3)), 1),
                         y = c(0, sort(runif(4)), 1, rep(1, 3), 1)), 1)
  rand <- runif(7)
  expect_equal(area_rect(x = c(0, rand, 1), y = c(0, rand, 1)), 0.5)
  expect_equal(area_rect(x = c(0, 0, 0.5, 1),
                         y = c(0, 0.5, 0.5, 1)), 5/8)
  expect_error(area_rect(x = rep(0, 4), y = rep(0, 6)))
})

values_letters <- runif(26)
names(values_letters) <- letters
true <- sample(letters, 10)
auc <- ebc_AUC(detection_values = values_letters, true = true, m = 26)

test_that("ebc_AUC() has the right behavior", {
  expect_is(auc, "numeric")
  expect_length(auc, 1)
  expect_error(ebc_AUC(detection_values = values_letters, true = true,
                       m = 26, measures = c("FDR", "TPR")))
})


test_that("AUC is the same with different directions", {
  expect_equal(ebc_AUC(detection_values = values_letters, true = true,
                       m = 26, direction = "<="), auc)
  expect_equal(ebc_AUC(detection_values = 1 - values_letters, true = true,
                       m = 26, direction = ">"), auc)
  expect_equal(ebc_AUC(detection_values = 1 - values_letters, true = true,
                       m = 26, direction = ">="), auc)
})
