#create_summary.R
#One sentences taken from description (HK)

#lexRankr summarizer

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
