#create_string.R

generateTweetText = function(artist, title, question, word, link) {
  hashtag = paste("#", word, "")
  question = paste(question, hashtag, " ")
  
  tweet_text = paste(artist, title, "@Thyssenmalaga", question, link, sep = "\n")
}

artists = carmen_data_utf.8$artist.list
titles = carmen_data_utf.8$work_title
questions = carmen_data_utf.8$questions #This and word are considering them added to the data
words = carmen_data_utf.8$word
links = carmen_data_utf.8$work_link.href

carmen_data_utf.8$tweet_body = generateTweetText(artists, titles, questions, words, links)

carmen_data_utf.8$tweet_length = nchar(carmen_data_utf.8$tweet_body)
