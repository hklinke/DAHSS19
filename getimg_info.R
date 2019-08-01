#getimg_info.R

for (i in 1:254) {
  name <- paste("images/", carmen_data_utf.8$work_ID[i], ".jpg", collapse = "", sep = "")
  img <- load.image(name)
  dimensions <- dim(img)
  
  carmen_data_utf.8$heigth[i] <- dimensions[1]
  carmen_data_utf.8$width[i] <- dimensions[2]
  carmen_data_utf.8$red[i] <- mean(R(img))
  carmen_data_utf.8$green[i] <- mean(G(img))
  carmen_data_utf.8$blue[i] <- mean(B(img))
  carmen_data_utf.8$avg_brightness[i] <- mean(c(carmen_data_utf.8$red[i], 
                                              carmen_data_utf.8$green[i],
                                              carmen_data_utf.8$blue[i]))
  
  message(round(i/254*100, digits = o), "%")
}



