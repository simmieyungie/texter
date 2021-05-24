# Get the overall weight of emotions conveyed in a tweet

#' Get the overall weight of emotions conveyed in a tweet
#'
#' @description This function will help you extract the weight of emotions conveyed in a tweet
#'
#' @param word_vec This is the corpus you want to extract the sentiments from
#'
#' @param details (A TRUE/FALSE value): If TRUE you get a more robust distribution of these emotions. FALSE is summarised as Positive or Negative
#'
#' @export
#'
#' @examples
#'
#' sentimentAnalyzer(doge$text, details = T)
#'
#' @importFrom dplyr rename mutate distinct count anti_join top_n inner_join row_number group_by ungroup slice
#' @importFrom tidytext unnest_tokens
#' @importFrom textdata lexicon_nrc lexicon_bing
#' @importFrom magrittr %>%
#' @importFrom stopwords stopwords

sentimentAnalyzer <- function(word_vec, details){
  tabinfo <-  word_vec %>%
    as.data.frame() %>%
    rename(text = ".") %>%
    mutate(text = tolower(text)) %>%
    mutate(text = removeURL2(text)) %>%
    mutate(text = removeNumPunct(text)) %>%
    # mutate(text = str_remove_all(text, paste(remove_these, collapse = "|"))) %>%
    unnest_tokens(word, text) %>%
    anti_join(stopwords::stopwords() %>%
                as.data.frame() %>%
                rename(word = "."))

  if (details == F){
    tabinfo %>%
      inner_join(textdata::lexicon_bing()) %>%
      count(word, sentiment, sort = T) %>%
      distinct(word, .keep_all = T) %>%
      ungroup() %>%
      group_by(sentiment) %>%
      summarise(n = sum(n))

  } else {
    tabinfo %>%
      inner_join(textdata::lexicon_nrc()) %>%
      count(word, sentiment, sort = T) %>%
      distinct(word, .keep_all = T) %>%
      ungroup() %>%
      group_by(sentiment) %>%
      summarise(n = sum(n))
  }

}



