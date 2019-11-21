library(devtools)
library(usethis)
library(testthat)

#### One time ####

# use_build_ignore("dev_history.R")

# use_r("measures")

# Did this outside the project
# # git checkout --orphan gh-pages
# # git rm -rf .
# # git commit --allow-empty -m 'Initial gh-pages commit'
# # git push origin gh-pages
# # git checkout master

# travis::use_travis_deploy()

# use_r("helpers")

# use_r("threshold")
# use_test("threshold")

# use_r("area")
# use_test("area")

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

# pkgdown::template_reference()

install(upgrade = "never")
rmarkdown::render("README.Rmd", output_format = "md_document")
pkgdown::build_site()
unlink(c("pkgdown/", "docs/"), recursive = TRUE)
install(upgrade = "never")
