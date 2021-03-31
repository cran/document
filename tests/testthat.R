fritools::set_run_r_tests(fritools::is_running_on_fvafrcu_machines() ||
                          fritools::is_running_on_gitlab_com(), force = TRUE)
library("testthat")
library("document")
test_check("document")
