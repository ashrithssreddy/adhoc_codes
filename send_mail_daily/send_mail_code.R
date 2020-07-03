if(!require("mailR")){install.packages("mailR",dependencies = TRUE,repos ="https://cran.rstudio.com");library("mailR")}
if(!require("dplyr")){install.packages("dplyr",dependencies = TRUE,repos ="https://cran.rstudio.com");library("dplyr")}
rm(list=ls()); cat("\014");

# # todays_date=Sys.Date()
# future_date = as.Date("2056-03-26")
# date_difference = (future_date - Sys.Date()) %>% as.numeric 
# 
# date_difference_years = date_difference%/%365
# date_difference_months = (date_difference%%365) %/%30
# date_difference_days = (date_difference%%365) %%30
# 
# # mailR::send.mail(from = "ashrith.reddy@live.com",
# #           to = c("ashrithssreddy@gmail.com"),
# #           body = paste0(date_difference," days left"),
# #           subject =    paste0(date_difference_years," years, ",date_difference_months," months, ",date_difference_days," days"),
# #           smtp = list(host.name = "smtp-mail.outlook.com", port = 587,
# #                       user.name = "ashrith.reddy@live.com",
# #                       passwd = "backspaceA!1",  tls=TRUE),
# #           authenticate = TRUE,
# #           send = TRUE)

mailR::send.mail(from = "ashrith.reddy@live.com",
                 to = c("ashrithssreddy@gmail.com"),
                 body = "test body",
                 subject =    "test subj",
                 smtp = list(host.name = "smtp-mail.outlook.com", port = 587,
                             user.name = "ashrith.reddy@live.com",
                             passwd = "asdsadsadasd",  tls=TRUE),
                 authenticate = TRUE,
                 send = TRUE)