#create_date.R
message("create_date.R")

parseDate = function(dateString) {
  year = substr(dateString, nchar(dateString)-3, nchar(dateString))
  year = as.numeric(year)
  
  return(year)
}

dates = carmen_data_utf.8$work_creaded

carmen_data_utf.8$finished_date = parseDate(dates)
