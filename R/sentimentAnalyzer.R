# Get the overall weight of emotions conveyed in a corpus

#' Get the overall weight of emotions conveyed in a corpus
#'
#' @description This function will help you extract the weight of emotions conveyed in a tweet
#'
#' @param word_vec This is the corpus you want to extract the sentiments from
#'
#' @param details (A TRUE/FALSE value): If TRUE you get a more robust distribution of these emotions. FALSE is summarised as Positive or Negative
#' @return a data frame object. A data frame of each emotions and their corresponding weight in text
#' @export
#'
#' @examples
#'
#' sentimentAnalyzer(doge$text, details = TRUE)
#'
#' @importFrom dplyr rename mutate slice distinct count anti_join top_n inner_join row_number group_by ungroup slice
#' @importFrom tidytext unnest_tokens
#' @importFrom textdata lexicon_bing
#' @importFrom magrittr %>%
#' @importFrom stopwords stopwords

sentimentAnalyzer <- function(word_vec, details){
  tabinfo <-  word_vec %>%
    as.data.frame() %>%
    rename(text = ".") %>%
    mutate(text = tolower(text)) %>%
    mutate(text = removeURL(text)) %>%
    mutate(text = removeNumPunct(text)) %>%
    # mutate(text = str_remove_all(text, paste(remove_these, collapse = "|"))) %>%
    unnest_tokens(word, text) %>%
    anti_join(stopwords() %>%
                as.data.frame() %>%
                rename(word = "."))

  if (details == FALSE){
    tabinfo %>%
      inner_join(lexicon_bing()) %>%
      count(word, sentiment, sort = T) %>%
      distinct(word, .keep_all = T) %>%
      ungroup() %>%
      group_by(sentiment) %>%
      summarise(n = sum(n))

  } else {
    tabinfo %>%
      inner_join(nrc) %>%
      count(word, sentiment, sort = TRUE) %>%
      distinct(word, .keep_all = TRUE) %>%
      ungroup() %>%
      group_by(sentiment) %>%
      summarise(n = sum(n))
  }

}



