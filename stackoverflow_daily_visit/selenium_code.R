if(!require("RSelenium")){install.packages("RSelenium",dependencies = T);library("RSelenium")}
if(!require("magrittr")){install.packages("magrittr",dependencies = T);library("magrittr")}
if(!require("rvest")){install.packages("rvest",dependencies = T);library("rvest")}
gc(); 
options(scipen = 999)
dev.off()
rm(list=ls()); cat("\014")

driver<- rsDriver(browser=c("chrome")) # will take long the first time
remDr <- driver[["client"]]
remDr$navigate("https://stackoverflow.com/users/login?ssrc=head&returnurl=https%3a%2f%2fstackoverflow.com%2f")
wxbox = remDr$findElement(using = "css selector", "#email")
wxbox$sendKeysToElement(list("ashrithssreddy@gmail.com"))
wxbox = remDr$findElement(using = "css selector", "#password")
wxbox$sendKeysToElement(list("asfdsddsfsdasdsad"))
wxbox = remDr$findElement(using = "css selector", "#submit-button.fr")
wxbox$clickElement()
Sys.sleep(10)
remDr$navigate("https://stackoverflow.com/users/6323610/ashrith")
remDr$close()
driver$server$stop()
driver$server$process