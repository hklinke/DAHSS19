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

addTextLandscape = function(image, summary, textColor){
  summary_lines = strwrap(summary, 110)
  startPoint = 400
  
  for(line in summary_lines) {
    linePoint = paste("+25", as.character(startPoint), sep = "+")
    
    image = image_annotate(image, line, size = 20, color = textColor, location = linePoint)
    
    startPoint = startPoint + 30
  }
  
  return(image)
}

addTextPortrait = function(image, summary, textColor){
  summary_lines = strwrap(summary, 55)
  startPoint = 25
  
  for(line in summary_lines) {
    linePoint = paste("+20", as.character(startPoint), sep = "+")
    
    image = image_annotate(image, line, size = 20, color = textColor, location = linePoint)
    
    startPoint = startPoint + 30
  }
  
  return(image)
}

addText =  function(image, img_width, img_height, summary, color){
  if(img_width > img_height) {
    return(addTextLandscape(image, summary, color))
  } else {
    return(addTextPortrait(image, summary, color))
  }
}

processImage = function(img_path, img_width, img_height, summary, copyright, background_color, text_color) {
  image = reshapeImage(img_path, img_width, img_height, background_color)
  image = addCopyright(image, copyright)
  image = addText(image, img_width, img_height, summary, text_color)
  
  image_write(image, path = gsub("images", "flashcards", img_path), format = "jpg")
} 

processImage("images/CTB.1989.7.jpg", 2200, 3277, "This is a cool summary", "Copyright", "orange", "black")
