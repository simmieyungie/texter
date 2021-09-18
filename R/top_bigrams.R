#'

library(tidytext)
library(ggra)

apple <- read.csv("https://raw.githubusercontent.com/Ashish25/AppleTweetSentimentAnalysis/master/apple.csv")



buhari <- read.csv("https://raw.githubusercontent.com/simmieyungie/TextAnalyticsGCFR/main/buhari.csv")

apple%>%
  mutate(text = tolower(text)) %>%
  mutate(text = removeURL(text)) %>%
  mutate(text = removeNumPunct(text)) %>%
  mutate(text = gsub("в", "", text)) %>%
  mutate(text = gsub("вп", "", text)) %>%
  mutate(text = gsub("apl", "apple", text)) %>%
  unnest_tokens(word, text, token = "ngrams", n = 2) %>%
  separate(word, c("word1", "word2"), sep = " ") %>%
  filter(!word1 %in% stop_words$word) %>%
  filter(!word2 %in% stop_words$word) %>%
  drop_na(c(word1, word2)) %>%
  unite(word,word1, word2, sep = " ") %>%
  count(word, sort = TRUE) %>%
  slice(1:10) #%>%
  unite(bigram, word1, word2, sep = " ") %>%
  group_by(bigram) %>%
  count(sort = T) %>%
  ungroup() %>%
  slice_max(order_by = n, n = 20)

#To add:
  #words to remove
  #


# %>%
  graph_from_data_frame() %>%
  ggraph(., layout = "fr") +
  geom_edge_link() +
  geom_node_point(color = "lightblue", size = 3) +
  geom_node_text(aes(label = name), vjust = 0.6, hjust = 0.2) +
  theme_void()
