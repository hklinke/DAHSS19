#create_date.R
message("create_date.R")

parseDate = function(dateString) {
  year = substr(dateString, nchar(dateString)-3, nchar(dateString))
  
  if (year == "s.f.")
    return(NULL)
  
  return(as.numeric(year))
}

dates = carmen_data_utf.8$work_creaded

carmen_data_utf.8$creation_date = Map(parseDate, dates)
