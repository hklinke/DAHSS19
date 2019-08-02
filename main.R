#main

#install packages
install.packages("udpipe")
library(udpipe)
install.packages("stopwords")
library(stopwords)
install.packages("lexRankr")
library(lexRankr)
install.packages("imager")
library(imager)
install.packages("magick")
library(magick)

#initial definitions
default_hashtag_1="DAHSS19"
default_hashtag_2="Málaga"
thyssen_handle="@thyssenmalaga"
default_lat=36.72164
default_long=-4.42242
server_url="http://harald-klinke.de/proj_DAHSS19/"

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
 
#Create flashcards URL

#Create Date, time: every day starting Sat, Aug 3,  10:00

#Create a new data table
#Add intro tweet for Fri, 18:00 for testing reasons
#Add last tweet
#Export to TSV file (UTF-8)
source("create_TSV.R")




