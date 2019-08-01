#create_keyword.R

install.packages("udpipe")
library(udpipe)

ud_model_english=udpipe_download_model(language = "english") #Do this once only
ud_model_spanish=udpipe_download_model(language = "spanish") #Do this once only

ud_model_english=udpipe_load_model(ud_model_english$file_model)
ud_model_spanish=udpipe_load_model(ud_model_spanish$file_model)


for (i in 1:254) {
  
  if (carmen_data_utf.8$work_ID == "CTB.2015.242"){
    x=udpipe_annotate(ud_model_spanish, x=carmen_data_utf.8$work_decription[i])  #MUST be UTF8!
    x=as.data.frame(x)
    
    stats=keywords_rake(x=x, term="lemma", group= c("doc_id")
                        , relevant=x$upos %in% c("NOUN","ADJ"), ngram_max = 1)
    
    stats=subset(stats, stats$ngram==1)
    
    stats=stats[order(-stats$rake, -stats$freq),]
    carmen_data_utf.8$keyword_1[i]=stats$keyword[1]
    carmen_data_utf.8$keyword_2[i]=stats$keyword[2]
    
    message(i/254*100)   
  } else {
  
  x=udpipe_annotate(ud_model_english, x=carmen_data_utf.8$work_decription[i])  #MUST be UTF8!
  x=as.data.frame(x)
  
  stats=keywords_rake(x=x, term="lemma", group= c("doc_id")
                      , relevant=x$upos %in% c("NOUN","ADJ"), ngram_max = 1)
  
  stats=subset(stats, stats$ngram==1)
  
  stats=stats[order(-stats$rake, -stats$freq),]
  carmen_data_utf.8$keyword_1[i]=stats$keyword[1]
  carmen_data_utf.8$keyword_2[i]=stats$keyword[2]
  
  message(i/254*100)
  }
}

