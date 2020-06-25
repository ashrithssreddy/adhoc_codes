library("dplyr")
library("data.table")
library("plyr")

rm(list=ls()); cat("\014")
files = dir(pattern = "gpa_by_academic_years_")
master = NULL
for(file in files){
  print(file)
  if(which(file == files) == 1){
    master = fread(file)
  }else{
    master = master %>% left_join(fread(file), by = c("applicant_id"="applicant_id"))
  }
  invisible(gc())
}
fwrite(master,"31_gpa_by_academic_years.csv")
