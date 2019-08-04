flashcard_width = 2048
flashcard_height = 1024
margin = 5

landscape_width = 2038
landscape_height = 379*2
portrait_width = 1014
portrait_height = 1014

characters_per_line_landscape = 130
max_lines_landscape = 5
characters_per_line_portrait = 58
copyright_size = 18
font_size = 32
pixels_per_line = 40

getMarginsLandscape = function(img_width, img_height){
  if(img_width/landscape_width > img_height/landscape_height) {
    x_margin = as.integer((flashcard_width - landscape_width)/2)
    y_margin = as.integer((landscape_height - img_height*landscape_width/img_width)/2) + flashcard_height - landscape_height + margin
  } else {
    x_margin = as.integer((flashcard_width - img_width*landscape_height/img_height)/2)
    y_margin = flashcard_height - landscape_height
  }
  
  x_margin = as.character(as.integer(x_margin))
  y_margin = as.character(as.integer(y_margin))
  
  dimensions = paste(x_margin, y_margin, sep = "x")
  
  return(dimensions)
}

getMarginsPortrait = function(img_width, img_height){
  x_margin = margin + as.integer(flashcard_width/2) + as.integer((portrait_width*(1 - img_width/img_height))/2)
  
  x_margin = as.character(as.integer(x_margin))
  y_margin = as.character(as.integer(margin))
  
  dimensions = paste(x_margin, y_margin, sep = "x")
  
  return(dimensions)
}

reshapeImageLandscape = function(img_path, img_width, img_height, color){
  painting = image_read(path = img_path)
  
  scale = paste(landscape_width, landscape_height, sep = "x")
  flashcard_dim = paste(flashcard_width, flashcard_height, sep = "x")
  offset = paste("+0", flashcard_height - landscape_height - 2*margin, sep = "+")
  
  new_image = image_scale(painting, scale)
  new_image = image_border(new_image, color, getMarginsLandscape(img_width, img_height))
  new_image = image_crop(new_image, paste(flashcard_dim, offset, sep = " "))
  
  return(new_image)
}

reshapeImagePortrait = function(img_path, img_width, img_height, color){
  painting = image_read(path = img_path)
  
  scale = paste(portrait_width, portrait_height, sep = "x")
  flashcard_dim = paste(flashcard_width, flashcard_height, sep = "x")
  
  new_image = image_scale(painting, scale)
  new_image = image_border(new_image, color, getMarginsPortrait(img_width, img_height))
  new_image = image_crop(new_image, flashcard_dim)
  
  return(new_image)
}

reshapeImage =  function(img_path, img_width, img_height, color){
  if(img_width > img_height) {
    return(reshapeImageLandscape(img_path, img_width, img_height, color))
  } else {
    return(reshapeImagePortrait(img_path, img_width, img_height, color))
  }
}

addCopyright = function(image, copyright, text_color){
  copyright_pos = paste("", margin, flashcard_height-4*margin, sep = "+")
  
  new_image = image_annotate(image, copyright, size = copyright_size, color = text_color, location = copyright_pos)
  
  return(new_image)
}

addTextLandscape = function(image, summary, textColor){
  summary_lines = strwrap(summary, characters_per_line_landscape)
  
  if(length(summary_lines) > max_lines_landscape) {
    summary_lines = summary_lines[1:(max_lines_landscape-1)]
    summary_lines[max_lines_landscape] = "[...]"
  }
  
  startPoint = landscape_height + 4*margin
  
  for(line in summary_lines) {
    linePoint = paste("+25", as.character(startPoint), sep = "+")
    
    image = image_annotate(image, line, size = font_size, color = textColor, location = linePoint)
    
    startPoint = startPoint + pixes_per_line
  }
  
  return(image)
}

addTextPortrait = function(image, summary, textColor){
  summary_lines = strwrap(summary, characters_per_line_portrait)
  startPoint = as.integer((flashcard_height - length(summary_lines)*pixels_per_line)/2)
  
  for(line in summary_lines) {
    linePoint = paste("+20", as.character(startPoint), sep = "+")
    
    image = image_annotate(image, line, size = font_size, color = textColor, location = linePoint)
    
    startPoint = startPoint + pixels_per_line
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
  image = addCopyright(image, copyright, text_color)
  image = addText(image, img_width, img_height, summary, text_color)
  
  image_write(image, path = gsub("images", "flashcards", img_path), format = "jpg")
} 

getHexColor = function(r, g, b){
  hex_red = as.character(as.hexmode(as.integer(r*255)))
  hex_green = as.character(as.hexmode(as.integer(g*255)))
  hex_blue = as.character(as.hexmode(as.integer(b*255)))
  
  hex_code = paste("#", hex_red, hex_green, hex_blue, sep = "")
  return(hex_code)
  
}

paths = paste(paste(image_folder, carmen_data_utf.8$work_ID, sep = ""), "jpg", sep = ".")
widths = carmen_data_utf.8$width
heights = carmen_data_utf.8$height
summaries = carmen_data_utf.8$summary
copyrights = carmen_data_utf.8$work_copyright
red_values = carmen_data_utf.8$red
green_values = carmen_data_utf.8$green
blue_values = carmen_data_utf.8$blue
brights = carmen_data_utf.8$avg_brightness


for(i in 1:nrow(carmen_data_utf.8)){
  img_text_color = if(brights[i] <= 0.5) {
    "white"
  } else {
    "black"
  }
  
  processImage(paths[i], 
               widths[i], 
               heights[i], 
               summaries[i], 
               copyrights[i], 
               getHexColor(red_values[i], green_values[i], blue_values[i]), 
               img_text_color)
  
  message(i)
}


