# Get the top words from text

#' Get the top n words from vector of text
#'
#'
#' @description This function is used to get the top N words from a corpus. It will retrieve the most occurring words based on frequency
#'
#' @param word_vec This is the corpus you want to extract the sentiments from
#'
#' @param remove_these This is a vector of characters you want cleaned out of the text
#'
#' @param size This is the Top N number of rows to be retrieved as an integer value
#'
#' @return a data frame object.
#'
#' @export
#'
#' @examples
#'
#' {
#' top_words(brexit$content, remove_these = c("news","uk"), size = 10)
#' }
#'
#' @importFrom dplyr rename mutate count anti_join top_n
#' @importFrom tidytext unnest_tokens
#' @importFrom stringr str_remove_all
#' @importFrom magrittr %>%
#' @importFrom stopwords stopwords
#'

#Version three of code
top_words <- function(word_vec, remove_these, size){

  #removeNumPunct <- function(x) gsub("[^[:alpha:][:space:]]*", "", x)

  #removeUR <- function(x) gsub("([[:alpha:]])(?=\\1)", "", x, perl = TRUE)


  if (missing(remove_these)){ #You could also use missing() to test whether or not the argument y was supplied:
    word_counts <- word_vec %>%
      as.data.frame() %>%
      rename(text = ".") %>%
      mutate(text = tolower(text)) %>%
      mutate(text = removeURL(text)) %>%
      mutate(text = removeNumPunct(text)) %>%
      # mutate(text = str_remove_all(text, paste(remove_these, collapse = "|"))) %>%
      unnest_tokens(word, text) %>%
      anti_join(stopwords() %>%
                  as.data.frame() %>%
                  rename(word = ".")) %>%
      count(word, sort = T)
  } else {
    word_counts <-  word_vec %>%
      as.data.frame() %>%
      rename(text = ".") %>%
      mutate(text = tolower(text)) %>%
      mutate(text = removeURL(text)) %>%
      mutate(text = removeNumPunct(text)) %>%
      mutate(text = str_remove_all(text, paste(remove_these, collapse = "|"))) %>%
      unnest_tokens(word, text) %>%
      anti_join(stopwords() %>%
                  as.data.frame() %>%
                  rename(word = ".")) %>%
      count(word, sort = T)
  }

  #Retrieve the top n values of the function
  if (missing(size)) {
    word_counts
  } else {
    word_counts %>%
      top_n(size)
  }

}

