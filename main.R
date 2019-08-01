#main

#install packages
install.packages("tidytext")
install.packages("dplyr")
library(tidytext)
library(dplyr)
install.packages("lexRankr")
library(lexRankr)


#initial definitions
default_hashtag_1="#DAHSS19"
default_hashtag_2="#Málaga"
thyssen_handle="@thyssenmalaga"
default_lat=36.721642
default_long=-4.422424

#Load data (from a URL) Responsible: Qiuzi
source("load_data.R")

#URL images download    Fernando
source("load_images.R")

#get creation date as numeric Victor
source("create_date.R")

#get information from images (average and dimensions) Fernando
#get average color (optional) total, rgb
#get dimensions of images
source("getimg_info.R")

#sort data by creation date 	Qiuzi
source("sort_by.R")

#Create keyword/hashtags Fernando
source("create_keyword.R")

#Create summary (optional) from description	Harald
source("create_summary.R")

#Create tweet string with max. characters 	Victor
source("create_string.R")

#Create flashcards 
source("create_flashcards.R")

  #create blank image with 16:9, 1024x512 (?), background: average color (optional)
  #resize and place artwork on it
  #place text
 
#Create flashcars URL

#Create Date, time: every day starting Aug 3,  10:00

#Create a new data table
#Export to TSV file


