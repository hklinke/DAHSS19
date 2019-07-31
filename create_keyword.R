#create_keyword.R

install.packages("tidytext")
install.packages("dplyr")
library(tidytext)
library(dplyr)

texts <- unnest_tokens(carmen_data_utf.8, word, work_decription)

texts.tf.idf <- count(texts, work_ID, word, artist_name, work_title, sort = TRUE)

texts.count <- texts.tf.idf %>% 
  group_by(work_ID) %>% 
  summarise(total = sum(n))
texts.tf.idf <- left_join(texts.tf.idf, texts.count)
# I could get the same result by writing a function that applies nchar() to every element in 
# carmen_utf.8$work_decription and stores the result in the correspondent work_ID inside
# texts.tf.idf, but this way is simplier.


# tf-idf
texts.tf.idf <- texts.tf.idf %>%
  bind_tf_idf(word, work_ID, n)
texts.tf.idf <- texts.tf.idf %>%
  arrange(desc(tf_idf))
