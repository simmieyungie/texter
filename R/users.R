# This function will extract the @username from tweets

#' Extract Usernames and tagged handles from tweets
#'
#' @description The function will extract any tagged handles from text
#'
#' @param x This is the corpus you want to extract the mentions from
#'
#' @param ... More inputs
#'
#' @return a character vector.
#' @export
#'
#' @examples
#'{
#' users("Come See this @simmie_kafaru")
#' }
#'
#'
#' @importFrom purrr map
#'
#'

users <- function(x, ...){
  split <- strsplit(x, " ")
  map(split, function(split)split[grepl("@[[:alnum:]]", split)])
}


