# Remove Punctuation from text

#' Easily remove Punctuation from Text
#' @description This function will help you remove punctuation and numbers from your text easily
#'
#' @param x is the text column you want the punctuation and texts removed from
#'
#'
#' @export
#'
#' @examples
#' {
#'removeNumPunct("is this your number? 01234")
#'
#' }
#'

removeNumPunct <- function(x) gsub("[^[:alpha:][:space:]]*", "", x)
