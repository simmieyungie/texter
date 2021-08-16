# URL Remover

#' A function to help you remove URLs from text
#' @description  This function helps remove URLs from text, particularly designed for tweets
#'
#' @return a character vector.
#' @export
#'
#' @param x is the text value you want to extract the texts from
#'
#'
#'
#'
removeURL <- function(x) gsub("([[:alpha:]])(?=\\1)", "", x, perl = TRUE)


