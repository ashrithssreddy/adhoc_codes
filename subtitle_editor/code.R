#### 00 Setting up ####
# Load required packages, install if requried. These packages are required for number-crunching and coding comfort.
if(!require("magrittr")){install.packages("magrittr", dependencies = T);library("magrittr")}
if(!require("dplyr")){install.packages("dplyr", dependencies = T);library("dplyr")}
rm(list=ls()) ; cat("\014"); dev.off(); set.seed(2021)

text = readLines("The.Dark.Knight.2008.1080p.720p.BluRay.x264.[YTS.MX]-English.srt")

#### 01 Identify lines with time ####
indices = grep(pattern = "-->", text)[1]

shift_time = 100 # in mlliseconds. Plus for forward shift, minus for backward shift
start = text[indices] %>% strsplit(split = " --> ") %>% unlist %>% `[[`(1)
end = text[indices] %>% strsplit(split = " --> ") %>% unlist %>% `[[`(2)

as.POSIXct(start)
(strptime(start, format = "%H:%M:%S,%OS3") + 0/100) %>% 
  format("%H:%M:%S,%OS6")

#### 99 Stray Codes ####
# , format, tz = ""
