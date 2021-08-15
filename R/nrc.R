#' This data was saved
#' NRC word-emotion association lexicon
#' @name nrc
#' @docType data
#' General purpose English sentiment/emotion lexicon. This lexicon labels words
#' with six possible sentiments or emotions: "negative", "positive", "anger",
#' "anticipation", "disgust", "fear", "joy", "sadness", "surprise", or "trust".
#' The annotations were manually done through Amazon's Mechanical Turk.
#'
#' License required for commercial use. Please contact Saif M. Mohammad
#' (saif.mohammad@nrc-cnrc.gc.ca).
#'
#' Citation info:
#'
#' This dataset was published in Saif Mohammad and Peter Turney. (2013),
#' ``Crowdsourcing a Word-Emotion Association Lexicon.'' Computational
#' Intelligence, 29(3): 436-465.
#'
#' article\{mohammad13, \cr
#' author = \{Mohammad, Saif M. and Turney, Peter D.\}, \cr
#' title = \{CROWDSOURCING A WORD–EMOTION ASSOCIATION LEXICON\}, \cr
#' journal = \{Computational Intelligence\}, \cr
#' volume = \{29\}, \cr
#' number = \{3\}, \cr
#' pages = \{436-465\}, \cr
#' doi = \{10.1111/j.1467-8640.2012.00460.x\}, \cr
#' url = \{https://onlinelibrary.wiley.com/doi/abs/10.1111/j.1467-8640.2012.00460.x\}, \cr
#' eprint = \{https://onlinelibrary.wiley.com/doi/pdf/10.1111/j.1467-8640.2012.00460.x\}, \cr
#' year = \{2013\} \cr
#' \}
#'
#'
#'
#' @return A tibble with 13,901 rows and 4 variables:
#' \describe{
#'   \item{word}{An English word}
#'   \item{sentiment}{Indicator for sentiment or emotion: "negative",
#'   "positive", "anger", "anticipation", "disgust", "fear", "joy", "sadness",
#'   "surprise", or "trust"}
#' }
#'
#' @source \url{http://saifmohammad.com/WebPages/lexicons.html}
#'
#' @description The dataset is saved from the textdata<https://github.com/EmilHvitfeldt/textdata/blob/master/R/lexicon_nrc.R> for easier access
NULL
