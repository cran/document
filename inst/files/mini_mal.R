#' Nothing Good For
#'
#' Just prints "foo!".
#' @author Your Name <you@@somewhe.re>
#' @param x Not needed.
#' @return NULL
#' @export
#' @examples
#' foo(x = 2)
foo <- function(x) {
    print("foo!")
    return(invisible(NULL))
}

#' Uhh
#'
#' Just prints "bar!".
#' @author Your Name <you@@somewhe.re>
#' @return NULL
#' @export
#' @examples
#' bar()
bar <- function() {
    print("bar!")
    return(invisible(NULL))
}
