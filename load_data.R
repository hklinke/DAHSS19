#load_data

message("load_data")
carmen_data_utf.8 <- read.csv("http://harald-klinke.de/projects/content/2-dahss19/2-our-data/carmen_data_utf-8.csv",
                              encoding="UTF-8", comment.char="#", stringsAsFactors = FALSE)

