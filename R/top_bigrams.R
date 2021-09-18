#' Get the top bigrams from text

#' Get the top n bigrams from vector of text
#'
#'
#' @description This function is used to get the top N bigrams from a corpus. It will retrieve the most occurring (two) combinations based on frequency
#'
#' @param word_vec This is the corpus you want to extract the sentiments from
#'
#' @param remove_these This is a vector of characters you want cleaned out of the text
#'
#' @param bigram_size This is the Top N number of rows to be retrieved as an integer value
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


top_bigrams <- function(word_vec, remove_these, bigram_size){
  #Test for data type of word_vec and convert
  if (class(word_vec) != "character"){
    word_vec <- dplyr::pull(data)
  }

  #if remove_these missing
  if (missing(remove_these)){
    bigram_count <- word_vec %>%
      as.data.frame() %>%
      rename(text = ".") %>%
      mutate(text = tolower(text)) %>%
      mutate(text = removeURL(text)) %>%
      mutate(text = removeNumPunct(text)) %>%
      unnest_tokens(word, text, token = "ngrams", n = 2) %>%
      separate(word, c("word1", "word2"), sep = " ") %>%
      filter(!word1 %in% stop_words$word) %>%
      filter(!word2 %in% stop_words$word) %>%
      drop_na(c(word1, word2)) %>%
      unite(word,word1, word2, sep = " ") %>%
      count(word, sort = TRUE)
  } else {
    bigram_count <- word_vec %>%
      as.data.frame() %>%
      rename(text = ".") %>%
      mutate(text = tolower(text)) %>%
      mutate(text = removeURL(text)) %>%
      mutate(text = removeNumPunct(text)) %>%
      mutate(text = str_remove_all(text, paste(remove_these, collapse = "|"))) %>%
      unnest_tokens(word, text, token = "ngrams", n = 2) %>%
      separate(word, c("word1", "word2"), sep = " ") %>%
      filter(!word1 %in% stop_words$word) %>%
      filter(!word2 %in% stop_words$word) %>%
      drop_na(c(word1, word2)) %>%
      unite(word,word1, word2, sep = " ") %>%
      count(word, sort = TRUE)
  }
  if (missing(bigram_size)){
    bigram_count
  } else {
    slice_max(bigram_count, order_by = n, n = bigram_size)
  }
}


top_bigrams(apple$text, remove_these = c("rt", "â"), bigram_size = 20)

write.csv(apple, "appletweets.csv", row.names = F)
