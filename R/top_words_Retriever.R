# Get the top words based on a key search word

#' Get the top words based on a key search word
#'
#' @description This function helps to search for the top n words but only based texts or rows
#' containing a key word. It is particularly useful when you want to search the top n words revolving
#' around a certain keyword
#'
#' @param word_vec This is the corpus you want to extract the sentiments from
#'
#' @param word_ret is the key word you want searched
#'
#' @param remove_these is a vector of characters you want cleaned out of the tex
#'
#' @param size is the N number of rows to be retrieved as an integer value
#'
#' @return a data frame object.
#' @export
#'
#' @examples
#'
#' {
#' top_words_Retriever(brexit$content, word_ret = "brexit", remove_these = c("news","uk"), size = 10)
#' }
#'
#' @importFrom dplyr rename mutate count anti_join top_n arrange slice filter select
#' @importFrom tidytext unnest_tokens
#' @importFrom stringr str_remove_all
#' @importFrom magrittr %>%
#' @importFrom stopwords stopwords
#' @importFrom plyr rbind.fill


top_words_Retriever <- function(word_vec, word_ret, remove_these, size){
  if (missing(word_ret)){ #Test to ensure that the search word in included
    print("Input the words to be retrieved")
  } else {
    if (missing(remove_these)){ #If the remove these is not included
      df <- word_vec %>% #unest words and turn to data frame
        as.data.frame() %>%
        rename(text = ".")

      #Get the top words for the search word
      word_counts <- rbind.fill(lapply(word_ret, function(x){
        df %>%
          mutate(exist = grepl(word_ret, text, ignore.case = T)) %>%
          filter(exist == TRUE) %>%
          select(-exist) %>%
          mutate(text = removeURL(text)) %>%
          mutate(text = removeNumPunct(text)) %>%
          # mutate(text = str_remove_all(text, paste(remove_these, collapse = "|"))) %>%
          unnest_tokens(word, text) %>%
          anti_join(stopwords() %>%
                      as.data.frame() %>%
                      rename(word = ".")) %>%
          count(word, sort = T)
      }))
    } else {
      df <- word_vec %>%
        as.data.frame() %>%
        rename(text = ".")


      word_counts <- rbind.fill(lapply(word_ret, function(x){
        df %>%
          mutate(exist = grepl(word_ret, text, ignore.case = T)) %>%
          filter(exist == TRUE) %>%
          select(-exist) %>%
          mutate(text = removeURL(text)) %>%
          mutate(text = removeNumPunct(text)) %>%
          mutate(text = str_remove_all(text, paste(remove_these, collapse = "|"))) %>%
          unnest_tokens(word, text) %>%
          anti_join(stopwords() %>%
                      as.data.frame() %>%
                      rename(word = ".")) %>%
          count(word, sort = T) %>%
          filter(!word %in% remove_these)
      }))
    }

    #Retrieve the top n values of the function
    if (missing(size)) {
      word_counts
    } else {
      word_counts %>%
        arrange(desc(n)) %>%
        slice(1:size)
    }
  }
}
