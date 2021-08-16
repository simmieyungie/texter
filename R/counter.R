# Count how many times a word occurs in a corpus

#' Get the number of times a vector of words occurs
#'
#' @description This function retrieves the number of times each word in a corpus occurs.
#' It returns a dataframe containing the word and the corresponding counts
#'
#'
#' @param word_vec This is the corpus you want to the word frequency extracted from
#'
#' @param words This is a vector of words you want to retrieve their frequency counts
#' @return a data frame object. A data frame object of strings and their corresponding count
#'
#'
#' @export
#' @importFrom dplyr rename mutate summarise top_n select
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
        mutate(text = removeURL(text)) %>%
        mutate(text = removeNumPunct(text)) %>%
        mutate(word_occur = str_count(text, x)) %>%
        summarise(n = sum(word_occur )) %>%
        mutate(key = x) %>%
        dplyr::select(key, n)
    }))

  }
}
