#' Paste A.
#'
#' Pastes a to front of string
#'
#' @param  text a string
#'
#' @return a character string
#'
#' @examples
#' paste_a("some_string")
paste_a <- function(text){
    paste0("a_", text)
}
