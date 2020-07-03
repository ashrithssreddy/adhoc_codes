library("dplyr")
rm(list=ls())
cat("\014")

#### Laptop Screenshots ####
files = dir(full.names = F)

files %>% 
  sapply(function(x) {
    new_name = x %>% file.info %>% pull(mtime) %>% as.character() %>% 
      stringr::str_replace_all(pattern = "-", replacement = "_") %>% 
      stringr::str_replace_all(pattern = " ", replacement = "_") %>% 
      stringr::str_replace_all(pattern = ":", replacement = "_") %>% 
      paste0("laptop_screenshot_",.,".png")
    file.rename(x, new_name)})
