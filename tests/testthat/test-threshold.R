context("Threshold")

X1 <- rnorm(50)
X2 <- rnorm(50)
X3 <- rnorm(50)
predictors <- paste0("X", 1:3)
df_lm <- data.frame(X1 = X1, X2 = X2, X3 = X3,
                    X4 = X1 + X2 + X3 + rnorm(50, sd = 0.5),
                    X5 = X1 + 3 * X3 + rnorm(50, sd = 0.5),
                    X6 = X2 - 2 * X3 + rnorm(50, sd = 0.5),
                    X7 = X1 - X2 + rnorm(50, sd = 2),
                    Y  = X1 - X2 + 3 * X3 + rnorm(50))
model <- lm(Y ~ ., data = df_lm)
pvalues <- summary(model)$coefficients[-1, 4]
L <- length(unique(pvalues))
mymeasures <- c("TN", "TPR", "PPV", "FNR", "FDR", "ACC")

df_th <- ebc_tidy_by_threshold(detection_values = pvalues, true = predictors,
                               m = 7, sup_threshold = 0, measures = mymeasures)


test_that("output has the correct format", {
  expect_is(df_th, "data.frame")
  expect_equal(colnames(df_th), c("threshold", mymeasures))
  expect_equal(nrow(df_th), L + 1)
})


df_th <- ebc_tidy_by_threshold(detection_values = pvalues, true = predictors,
                               m = 7, sup_threshold = 0,
                               measures = ebc_allmeasures)
th <- mean(df_th$threshold[2:3])

test_that("values are correct", {
  expect_equivalent(df_th[2, -1],
                    ebc_tidy(detected = pvalues <= th, true = predictors,
                             m = 7, measures = ebc_allmeasures))
})

df_th_wosup <- ebc_tidy_by_threshold(detection_values = pvalues,
                                     true = predictors, m = 7)
df_th_wosup_rev <- ebc_tidy_by_threshold(detection_values = pvalues,
                                         true = predictors, m = 7,
                                         direction = "geq")

test_that("if instructions work", {
  expect_equal(nrow(df_th_wosup), L + 1)
  expect_equal(nrow(df_th_wosup_rev), L + 1)
  expect_equivalent(df_th_wosup$threshold[2:(L+1)], sort(pvalues))
  expect_equivalent(df_th_wosup_rev$threshold[1:L], sort(pvalues))
})


values_letters <- runif(26)
names(values_letters) <- letters
true <- sample(letters, 10)
df_all <- ebc_tidy_by_threshold(detection_values = values_letters, true = true,
                                m = 26,  measures = ebc_allmeasures,
                                direction = "leq", sup_threshold = 0)

test_that("relationshifts betweens values are correct", {
  expect_equal(df_all$TPR, 1 - df_all$FNR)
  expect_equal(df_all$TNR, 1 - df_all$FPR)
  expect_equal(df_all$PPV, 1 - df_all$FDR)
  expect_equal(df_all$NPV,1 - df_all$FOR)
  HM <- 2 / ((1 / df_all$TPR) + (1 / df_all$PPV))
  expect_equal(df_all$F1[!is.nan(HM)], HM[!is.nan(HM)])
})
