#create_string.R
install.packages("stopwords")
library(stopwords)
stopwords <- data_stopwords_stopwordsiso$en


generateTweetText = function(artist, title, question, word1, word2, link) {
  hashtag1 = paste("#", word1, "")
  hashtag2 = paste("#", word2, "")
  question_and_answer = paste(question, hashtag1, hashtag2, " ")
  
  tweet_text = paste(artist, title, thyssen_handle, question_and_answer, link, sep = "\n")
}

artists = carmen_data_utf.8$artist.list
titles = carmen_data_utf.8$work_title
questions = "Guess the year!"   

# check against stopwords and na
carmen_data_utf.8$keyword_1[which(carmen_data_utf.8$keyword_1 %in% stopwords == T)] <- NA
carmen_data_utf.8$keyword_2[which(carmen_data_utf.8$keyword_2 %in% stopwords == T)] <- NA
carmen_data_utf.8$keyword_1[is.na(carmen_data_utf.8$keyword_1)] <- default_hashtag_1
carmen_data_utf.8$keyword_2[is.na(carmen_data_utf.8$keyword_2)] <- default_hashtag_2

words = carmen_data_utf.8$keyword_1  #carmen_data_utf.8$word
links = carmen_data_utf.8$work_link.href

carmen_data_utf.8$tweet_body = generateTweetText(artists, titles, questions, words, links)

carmen_data_utf.8$tweet_length = nchar(carmen_data_utf.8$tweet_body)
