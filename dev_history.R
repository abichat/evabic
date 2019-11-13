library(devtools)
library(usethis)
library(testthat)

#### One time ####

# use_build_ignore("dev_history.R")

# use_r("measures")


#### Repeated ####

load_all()

document()
attachment::att_to_description()
use_tidy_description()

# covr::package_coverage()

spell_check()
# spelling::update_wordlist()

run_examples()

test()

check()
goodpractice::gp()

#### Less often ####

install(upgrade = "never")
rmarkdown::render("README.Rmd", output_format = "md_document")
install(upgrade = "never")


# chameleon::build_pkgdown()

