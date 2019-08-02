#create_TSV.R

# Create an empty container
ThyssenMlgBot <- as.data.frame(matrix(nrow = 256, ncol = 6))
colnames(ThyssenMlgBot) <- c("Date", "Time", "Tweet", "Picture", "Longitude", "Latitude")

# Include the data from carmen_data_utf.8
ThyssenMlgBot$Tweet <- c(NA, carmen_data_utf.8$tweet_body,NA) 
ThyssenMlgBot$Time <- "10:00"
#ThyssenMlgBot$Longitude <- carmen_data_utf.8$longitude   it could also be the Thyssen's
#ThyssenMlgBot$Latitude <- carmen_data_utf.8$latitude     it could also be the Thyssen's
# Create an array with the picture's url
pictures_url <- paste(server_url, carmen_data_utf.8$work_ID, ".jpg", sep = "")
ThyssenMlgBot$Picture <- c(NA, pictures_url,NA)
# Sort
# Create a date array
publication_dates <- paste(c(2:31, rep(c(1:30, 1:31), 2), 1:31, 1:29, 1:31, 1:13), 
                           c(rep(08, 30), rep(09, 30), rep(10, 31),
                             rep(11, 30), rep(12, 31), rep(01, 31),
                             rep(02, 29), rep(03, 31), rep(04, 13)),
                           c(rep(2019, 152), rep(2020, 104)), 
                           sep = ".")
ThyssenMlgBot$Date <- publication_dates





write.table(test, file='ThyssenMlgBot.tsv', quote=FALSE, sep='\t')
