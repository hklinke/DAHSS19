#main
message("Running main")

#initial definitions
default_hashtag="#DAHSS19"
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
source("getimg_info.R")

#sort data by creation date 	Qiuzi
source("sort_by.R")

#Create keyword/hashtags Fernando
source("create_keyword.R")

#Create summary (optional) from description	Harald
source("create_summary.R")

#Create tweet string with max. characters 	Victor
source("create_string.R")



#get average color (optional) total, rgb
#source("get_average.R")
#get dimensions of images
#source("get_dims.R")
