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
                               m = 7, measures = mymeasures)


test_that("output has the correct format", {
  expect_is(df_th, "data.frame")
  expect_equal(colnames(df_th), c("threshold", mymeasures))
  expect_equal(nrow(df_th), L + 1)
})


df_th <- ebc_tidy_by_threshold(detection_values = pvalues, true = predictors,
                               m = 7, measures = ebc_allmeasures,
                               direction = "<")
th <- mean(df_th$threshold[2:3])

test_that("values are correct", {
  expect_equivalent(df_th[3, -1],
                    ebc_tidy(detected = pvalues < th, true = predictors,
                             m = 7, measures = ebc_allmeasures))
})

n_letters <- length(letters)
values_letters <- runif(n_letters)
names(values_letters) <- letters
true <- sample(letters, 10)
df_all <- ebc_tidy_by_threshold(detection_values = values_letters, true = true,
                                m = n_letters,  measures = ebc_allmeasures)

test_that("relationships betweens values are correct", {
  expect_equal(df_all$TPR, 1 - df_all$FNR)
  expect_equal(df_all$TNR, 1 - df_all$FPR)
  expect_equal(df_all$PPV, 1 - df_all$FDR)
  expect_equal(df_all$NPV,1 - df_all$FOR)
  HM <- 2 / ((1 / df_all$TPR) + (1 / df_all$PPV))
  expect_equal(df_all$F1[!is.nan(HM)], HM[!is.nan(HM)])
  expect_equal(df_all$DOR, df_all$PLR / df_all$NLR)
})


df_all_leq <-
  ebc_tidy_by_threshold(detection_values = values_letters, true = true,
                        m = n_letters, measures = ebc_allmeasures,
                        direction = "<=")
df_all_geq <-
  ebc_tidy_by_threshold(detection_values = values_letters, true = true,
                        m = n_letters, measures = ebc_allmeasures,
                        direction = ">=")
df_all_g <-
  ebc_tidy_by_threshold(detection_values = values_letters, true = true,
                        m = n_letters, measures = ebc_allmeasures,
                        direction = ">")

test_that("directions give the correct output", {
  expect_equal(df_all[, -1], df_all_leq[, -1])
  expect_equal(df_all$threshold[-(n_letters + 1)], df_all_leq$threshold[-1])
  expect_equal(df_all_g[, -1], df_all_geq[, -1])
  expect_equal(df_all_g$threshold[-1], df_all_geq$threshold[-(n_letters + 1)])
})

test_that("all or nothing is detected at +/-Inf", {
  expect_equivalent(df_all[1, c("TPR", "TNR")], c(0, 1))
  expect_equivalent(df_all[n_letters + 1, c("TPR", "TNR")], c(1, 0))
  expect_equivalent(df_all_g[1, c("TPR", "TNR")], c(1, 0))
  expect_equivalent(df_all_g[n_letters + 1, c("TPR", "TNR")], c(0, 1))
})




