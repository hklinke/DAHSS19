#create_string.R

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
words = carmen_data_utf.8$keyword_1  #carmen_data_utf.8$word
links = carmen_data_utf.8$work_link.href

carmen_data_utf.8$tweet_body = generateTweetText(artists, titles, questions, words, links)

carmen_data_utf.8$tweet_length = nchar(carmen_data_utf.8$tweet_body)
