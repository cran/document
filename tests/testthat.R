document::set_RUN_R_TESTS(document::is_running_on_fvafrcu_machines() ||
                          document::is_running_on_gitlab_com(), force = TRUE)
library("testthat")
library("document")
test_check("document")
