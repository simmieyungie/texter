# Get the top 10 negative and positive words expressed in a corpus
#' Get the  top 10 negative and positive words
#'
#'
#' @description This function returns the top 10 positive and negative words expressed in a text.
#' By defaults a data frame of words classified as positve or negative based on weights.
#'
#' @param word_vec This is the corpus you want to extract the sentiments from
#'
#' @param plot (TRUE/FALSE) TRUE means you want to return a plot which you can further customize. FALSE means a dataframe will be returned
#'
#' @export
#'
#' @example
#' Top_Sentiments(doge$text, plot = T) #Will return a plot
#'
#' @importFrom dplyr rename mutate count anti_join top_n inner_join row_number group_by ungroup slice
#' @importFrom tidytext unnest_tokens stop_words get_sentiments
#' @importFrom stringr str_remove_all
#' @importFrom magrittr %>%
#' @importFrom ggplot2 geom_col labs facet_wrap


Top_Sentiments <- function(word_vec, plot){

  if (plot == TRUE){
    word_vec%>%
      as.data.frame() %>%
      mutate(linenum = row_number()) %>%
      rename(text = ".") %>%
      mutate(text = tolower(text)) %>%
      mutate(text = removeURL2(text)) %>%
      mutate(text = removeNumPunct(text)) %>%
      # mutate(text = str_remove_all(text, paste(remove_these, collapse = "|"))) %>%
      unnest_tokens(word, text) %>%
      anti_join(stop_words) %>%
      inner_join(get_sentiments("bing")) %>%
      group_by(word, sentiment) %>%
      count() %>%
      ungroup() %>%
      group_by(sentiment) %>%
      top_n(10) %>%
      mutate(word = reorder(word, n)) %>%
      ggplot(aes(n, word, fill = sentiment)) +
      geom_col(show.legend = FALSE) +
      facet_wrap(~sentiment, scales = "free_y") +
      labs(x = "Contribution to sentiment",
           y = NULL)
  } else if (plot == FALSE){

    TopSents <- word_vec%>%
      as.data.frame() %>%
      mutate(linenum = row_number()) %>%
      rename(text = ".") %>%
      mutate(text = tolower(text)) %>%
      mutate(text = removeURL2(text)) %>%
      mutate(text = removeNumPunct(text)) %>%
      # mutate(text = str_remove_all(text, paste(remove_these, collapse = "|"))) %>%
      unnest_tokens(word, text) %>%
      anti_join(stop_words) %>%
      inner_join(get_sentiments("bing")) %>%
      group_by(word, sentiment) %>%
      count() %>%
      ungroup() %>%
      group_by(sentiment) %>%
      slice(1:10)
    TopSents
  }
}
