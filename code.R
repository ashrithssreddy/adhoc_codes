library("RSelenium")
rm(list=ls())
cat("\014")

driver<- rsDriver(browser=c("chrome"))
remDr <- driver[["client"]]
remDr$navigate("https://stats.stackexchange.com/users/login?ssrc=head&returnurl=https%3a%2f%2fstats.stackexchange.com%2f")
mailid<-remDr$findElement('name',  "email")
if(F){
  mailid$sendKeysToElement(list("assadasd@gmail.com"))
  mailid<-remDr$findElement('name',  "password")
  mailid$sendKeysToElement(list("sdsadasdA!1"))
  login <- remDr$findElement("css selector",'#js-gdpr-consent-banner > div > a > svg > path')
  login$clickElement()
  login <- remDr$findElement('id',"submit-button")
  login$clickElement()
  Sys.sleep(5)
  
  remDr$navigate("https://www.stackoverflow.com")
  Sys.sleep(5)
  remDr$navigate("https://academia.stackexchange.com/")
  Sys.sleep(5)
  remDr$navigate("https://datascience.stackexchange.com/")
  Sys.sleep(5)
  remDr$navigate("https://superuser.com/")
  Sys.sleep(5)
  remDr$navigate("https://ai.stackexchange.com/")
  Sys.sleep(5)
  remDr$navigate("https://codereview.stackexchange.com/")
  Sys.sleep(5)
  remDr$close()
  driver$server$stop()
  
}


print("1")