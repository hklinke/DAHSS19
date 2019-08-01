#create_summary.R
#One sentences taken from description (HK)

install.packages("lexRankr")
library(lexRankr)


#lexRankr summarizer
#https://adamspannbauer.github.io/2017/12/17/summarizing-web-articles-with-r/

##Add column to data!

for (i in 1:nrow(carmen_data_utf.8)) {
  if (nchar(carmen_data_utf.8$work_decription[i])>10) { #If too short or empty
    carmen_data_utf.8$summary[i] = 
      lexRank(carmen_data_utf.8$work_decription[i],
              docId = 1, #only 1 article, not corpus
              n = 1, #return 1 sentences
              continuous = TRUE)$sentence
    
    message(i, " Done with ", nchar(carmen_data_utf.8$summary[i]), " length." )
  } else  
  {
    carmen_data_utf.8$summary[i] = ""
  message(i, " *Empty*" )
  }
}


#That's all
#Now check the results

#shortest, longest and median sentence
summary(
  nchar(
    carmen_data_utf.8$summary #[1:2]
  )
)

#   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#   0.0   171.5   245.5   263.3   327.5   956.0 

#example
carmen_data_utf.8$summary[1]
nchar(carmen_data_utf.8$summary[1])

carmen_data_utf.8$summary[106]
nchar(carmen_data_utf.8$summary[106])

# Check which are empty, shortest
subset(carmen_data_utf.8,nchar(carmen_data_utf.8$work_decription)<10, 
       select=c(work_title, work_decription, summary))

#                                     work_title work_decription summary
#63                              The Annunciation                        
#66                      Reception at the Village                        
#107                                    Landscape                        
#109                      The Birth of the Virgin               -        
#181                The Adoration of the Sheperds               -        
#192 The Betrothal of the Virgin and Saint Joseph               -  

#how to deal with empty lines?
#Use default sentence or leve blank?

# Check which are the longest
subset(carmen_data_utf.8,nchar(carmen_data_utf.8$summary)>900, select=c(work_title,summary))

#errors
carmen_data_utf.8$summary[161]
nchar(carmen_data_utf.8$summary[161])

