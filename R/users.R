# This function will extract the @username from tweets

#' Extract Usernames and tagged handles from tweets
#'
#' @description The function will any tagged handles from text
#'
#' @param x this is the text you intend to extract the handles tagged
#'
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


