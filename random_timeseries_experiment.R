if(!require("lubridate")){install.packages("lubridate");library("lubridate");}
if(!require("dplyr")){install.packages("dplyr");library("dplyr");}


dataset= cranlogs::cran_downloads(package="dplyr",from="2000-01-01",to=format(Sys.time(),"%Y-%m-%d"))
dataset$month = lubridate::month(dataset$date)
dataset$year = lubridate::year(dataset$date)
dataset$day = lubridate::day(dataset$date)
dataset$weekday = weekdays(dataset$date)

dataset_yearly= dataset %>% dplyr::group_by(year) %>% dplyr::summarise(total_count= sum(count,na.rm=T))
dataset_monthly= dataset %>% dplyr::group_by(month) %>% dplyr::summarise(total_count= sum(count,na.rm=T))
dataset_weekday= dataset %>% dplyr::group_by(weekday) %>% dplyr::summarise(total_count= sum(count,na.rm=T))
dataset_day= dataset %>% dplyr::group_by(day) %>% dplyr::summarise(total_count= sum(count,na.rm=T))