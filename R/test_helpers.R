#' Is the Machine Running the Current R Process Owned by FVAFRCU?
#' 
#' @return A logical.
#' @export
#' @keywords internal
is_running_on_fvafrcu_machines <- function() {
    sys_info <- Sys.info()
    r <- sys_info[["nodename"]] %in% c("h6", "h7") &&
        sys_info[["effective_user"]] == "qwer" &&
        .Platform[["OS.type"]] == "unix"
    return(r)
}

#' Is the Machine Running the Current R Process Owned by \url{https://about.gitlab.com}?
#' 
#' Check whether the current machine is located on \url{https://about.gitlab.com}. 
#' This check is an approximation only.
#' @param verbose Be verbose?
#' @return A logical.
#' @export
#' @keywords internal
is_running_on_gitlab_com <- function(verbose = TRUE) {
    r <- grepl("^runner-[0-9]*-project-[0-9]*-concurrent-[0-9]*$", 
               Sys.info()[["nodename"]]) && .Platform[["OS.type"]] == "unix"
    if (isTRUE(verbose)) 
        message(paste(Sys.info()[["nodename"]], .Platform[["OS.type"]]))
    return(r)
}

#' Set System Variable RUN_R_TESTS
#' 
#' @param x A logical, typically some function output.
#' @param force Overwrite the variable if already set?
#' @return The value RUN_R_TESTS is set to, \code{\link{NULL}} nothing is done.
#' @export
#' @keywords internal
#' @examples
#' set_RUN_R_TESTS(is_running_on_fvafrcu_machines())
#' get_RUN_R_TESTS()
#' set_RUN_R_TESTS(TRUE, force = TRUE)
#' get_RUN_R_TESTS()
set_RUN_R_TESTS  <- function(x, force = FALSE) {
    r <- NULL
    is_unset <- is.na(Sys.getenv("RUN_R_TESTS", unset = NA))
    if (is_unset || isTRUE(force)) {
        r <- x
        Sys.setenv("RUN_R_TESTS" = r)
    }
    return(invisible(r))
}

#' Get System Variable RUN_R_TESTS
#' 
#' Convenience wrapper to \code{\link{Sys.getenv}}.
#'
#' As \code{\link{Sys.getenv}} seems to always return a character vector, the
#' \code{\link{class}} of the value you set it to does not matter.
#' @param stop_on_failure Throw an error instead of returning 
#' \code{\link{FALSE}} if RUN_R_TESTS is not set or cannot be converted to
#' boolean.
#' @return The value RUN_R_TESTS is set to, converted to boolean.
#' \code{\link{FALSE}} if RUN_R_TESTS is not set or cannot be converted to
#' boolean.
#' @export
#' @keywords internal
#' @examples
#' set_RUN_R_TESTS("", force = TRUE) # make sure it is not set.
#' try(get_RUN_R_TESTS())
#' set_RUN_R_TESTS("A", force = TRUE) # "A" is not boolean.
#' try(get_RUN_R_TESTS())
#' set_RUN_R_TESTS(4213, force = TRUE) # All numbers apart from 0 are TRUE
#' get_RUN_R_TESTS()
#' set_RUN_R_TESTS("0", force = TRUE) # 0 (and "0") is FALSE
#' get_RUN_R_TESTS()
#' set_RUN_R_TESTS("FALSE", force = TRUE)
#' get_RUN_R_TESTS()
#' set_RUN_R_TESTS(TRUE, force = TRUE)
#' get_RUN_R_TESTS()
get_RUN_R_TESTS <- function(stop_on_failure = FALSE) {
    r <- Sys.getenv("RUN_R_TESTS")
    if (identical(r, "")) {
        if (isTRUE(stop_on_failure)) {
            throw("Environment variable RUN_R_TESTS is not set.")
        } else {
            r <- FALSE
        }
    } else {
        # Sys.getenv seems to always return a character vector.
        # So we first try to convert to numeric to take care of "0" and "1".
        # But this will crash for strings like "TRUE" and "FALSE", so we need to
        # try only.
        r <- tryCatch(as.numeric(r), warning = function(w) return(r))
        r <- as.logical(r) 
        if (is.na(r)) {
            if (isTRUE(stop_on_failure)) {
                throw(paste("Environment variable RUN_R_TESTS is set to", 
                            "a value not interpretable as boolean."))
            } else {
                r <- FALSE
            }
        } else {
            ## do nothing: r is set and not NA.
        }
    }
    return(r)
}
