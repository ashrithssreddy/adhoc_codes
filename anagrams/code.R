#### 00 Setting Up ####
if(!require("tidyr")){install.packages("tidyr",dependencies = T);library("tidyr")}
if(!require("rstudioapi")){install.packages("rstudioapi",dependencies = T);library("rstudioapi")}
if(!require("data.table")){install.packages("data.table",dependencies = T);library("data.table")}
if(!require("plyr")){install.packages("plyr",dependencies = T);library("plyr")}
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
rm(list=ls()); cat("\014")

#### 01 Read data ####
data = NULL
file = dir("data")[1]
for(file in dir("data")){
  print(file)
  temp = fread(paste0(getwd(),"/data/",file), header = F, sep = ",", quote = "")
  data = data %>% rbind(temp)
}
names(data) = "word"
rm(temp, file)

#### 02 Data Manipulation - Dedupicate ####
data = data %>% 
  unique

#### 02 Data Manipulation - Remove single letters ####
data = data %>% 
  dplyr::filter(nchar(word)>1)

#### 02 Data Manipulation - remove punctuation ####
data = data %>% 
  dplyr::filter(!grepl(data$word, pattern = "[[:punct:]]"))


#### 02 Data Manipulation - explode phrase into words ####
max_spaces = data$word %>% c("apple banana gauca","a b c d") %>% 
  sapply(function(x) gregexpr(x, pattern = " ")[[1]] %>% length) %>% 
  max
  
data = data %>% 
  separate(col = "word", into = as.character(1:max_spaces), sep = " ")

temp = data %>% 
  unite(word, as.character(1:max_spaces))




