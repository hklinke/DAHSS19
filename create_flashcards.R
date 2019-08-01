install.packages("magick")

library(magick)

getMarginsLandscape = function(img_width, img_height){
  if(img_width/1014 > img_height/379) {
    x_margin = 5
    y_margin = as.integer((512 - img_height*1014/img_width)/2)
  } else {
    x_margin = as.integer((1024 - img_width*379/img_height)/2)
    y_margin = 128
  }
  
  x_margin = as.character(as.integer(x_margin))
  y_margin = as.character(as.integer(y_margin))
  
  dimensions = paste(x_margin, y_margin, sep = "x")
  
  return(dimensions)
}

getMarginsPortrait = function(img_width, img_height){
  x_margin = (1-img_width/img_height)*251 + 522
  
  x_margin = as.character(as.integer(x_margin))
  y_margin = as.character(as.integer(5))
  
  dimensions = paste(x_margin, y_margin, sep = "x")
  
  return(dimensions)
}

reshapeImageLandscape = function(img_path, img_width, img_height, color){
  painting = image_read(path = img_path)
  
  new_image = image_scale(painting, "1014x379")
  new_image = image_border(new_image, color, getMarginsLandscape(img_width, img_height))
  new_image = image_crop(new_image, "1024x512 +0+123")
  
  return(new_image)
}

reshapeImagePortrait = function(img_path, img_width, img_height, color){
  painting = image_read(path = img_path)
  
  new_image = image_scale(painting, "502x502")
  new_image = image_border(new_image, color, getMarginsPortrait(img_width, img_height))
  new_image = image_crop(new_image, "1024x512")
  
  return(new_image)
}

reshapeImage =  function(img_path, img_width, img_height, color){
  if(img_width > img_height) {
    return(reshapeImageLandscape(img_path, img_width, img_height, color))
  } else {
    return(reshapeImagePortrait(img_path, img_width, img_height, color))
  }
}

addCopyright = function(image, copyright){
  new_image = image_annotate(image, copyright, size = 8, color = "white", boxcolor = "black", location = "+5+500")
  
  return(new_image)
}

image = reshapeImage("images/CTB.1996.16.jpg", 2200, 3243, "orange")

print(image)

image = addCopyright(image, "Copyright whatever")

print(image)
