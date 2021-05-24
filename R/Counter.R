# Count how many times a word occurs in a corpus

#' Get the number of times a vector of words occurs
#'
#' @description This function retrieves the number of times each word in a vector occurs.
#' It returns a dataframe containing the word and the corresponding counts
#'
#'
#' @param word_vec is the text column
#'
#' @param words this is a vector of words you want to retrieve their frequency counts
#'
#'
#'
#' @export
#' @importFrom dplyr rename mutate summarise top_n
#' @importFrom magrittr %>%
#' @importFrom stringr str_count
counter <- function(word_vec, words){
  if (missing(word_vec) || missing(words)){
    print("Error: You have not specified character set or words to return count")
  } else {

    plyr::rbind.fill(lapply(words, function(x){
      word_vec %>%
        as.data.frame() %>%
        rename(text = ".") %>%
        mutate(text = tolower(text)) %>%
        mutate(text = removeURL2(text)) %>%
        mutate(text = removeNumPunct(text)) %>%
        mutate(word_occur =stringr::str_count(text, x)) %>%
        summarise(n = sum(word_occur )) %>%
        mutate(key = x)
    }))

  }
}
