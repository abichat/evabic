library(tidyverse)
library(flextable)
library(officer)

df <- tibble(
  col1 = c("", "", "Detection", "Detection"),
  col2 = c("", "", "Detected positive", "Detected negative"),
  col3 = c("True condition", "Condition positive", "TP", "FN"),
  col4 = c("True condition", "Condition negative", "FP", "TN"))

df %>%
  flextable() %>%
  delete_part("header") %>%
  merge_v(j = 1:2) %>%
  merge_h(i = 1) %>%
  align(i = 1, j = 3:4, align = "center") %>%
  align(i = 3:4, j = 3:4, align = "center") %>%
  valign(i = 3, j = 1, valign = "center") %>%
  border_remove() %>%
  bg(i = 1:4, j = 1:4, bg = "papayawhip") %>%
  bg(i = 3, j = 3, bg = "#A0CF63") %>%
  bg(i = 4, j = 4, bg = "#A0CF63") %>%
  bg(i = 3, j = 4, bg = "#EB524E") %>%
  bg(i = 4, j = 3, bg = "#EB524E") %>%
  hline(i = 1, j = 3:4, border = fp_border(width = 1)) %>%
  hline(i = 2:4, j = 2:4, border = fp_border(width = 1)) %>%
  vline(i = 3:4, j = 1, border = fp_border(width = 1)) %>%
  vline(i = 2:4, j = 2:4, border = fp_border(width = 1)) %>%
  fontsize(size = 20) %>%
  height_all(0.5) %>%
  save_as_image(path = "man/figures/confusionmatrix.png")
