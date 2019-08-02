# Analysis

#Hist cr_date
hist(carmen_data_utf.8$finished_date, main="Distribution of artworks", breaks = 800, xlab="Creation year")

#Hist ac_date  
hist(as.numeric(substr(carmen_data_utf.8$work_ID,5,8)), breaks = 40, xlab="Acquisition year", 
     main="Distribution of acquisitions")
