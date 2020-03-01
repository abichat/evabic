context("Previous outputs")

values_letters <- seq(from = 0.0001, to = 0.99, length.out = 26) ^ 2
names(values_letters) <- letters
true <- c("b", "c", "d", "e", "i", "k", "y")

test_that("outputs do not change over time", {
  # Confusion
  expect_known_value(
    ebc_confusion(detected = values_letters < 0.05, true = true, m = 26),
    "previous_outputs/confusion", update = FALSE)
  # Unique value
  expect_known_value(
    ebc_FDR(detected = values_letters < 0.05, true = true),
    "previous_outputs/uniquevalue", update = FALSE)
  # Tidy
  expect_known_value(
    ebc_tidy(detected = values_letters < 0.05, true = true,
             m = 26, measures = ebc_allmeasures),
    "previous_outputs/tidy", update = FALSE)
  # Threshold
  expect_known_value(
    ebc_tidy_by_threshold(detection_values = values_letters, true = true,
                          m = 26, measures = ebc_allmeasures),
    "previous_outputs/threshold", update = FALSE)
  # AUC
  expect_known_value(
    ebc_AUC(detection_values = values_letters, true = true, m = 26),
    "previous_outputs/auc", update = FALSE)
})
