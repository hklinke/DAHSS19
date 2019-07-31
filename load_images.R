#load_images.R
message("load_images.R")


max=length(carmen_data_utf.8$work_image_URL.href)

for (i in 1:max) {
  filename <- paste("images/", carmen_data_utf.8$work_ID[i], ".jpg", collapse = "", sep = "")
  # message(i, " ", filename)
  download.file(url = carmen_data_utf.8$work_image_URL.href[i], 
                destfile = filename,  
                mode = "wb")
  print(i/max*100)
}

