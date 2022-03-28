#### 00 Setting Up ####
if(!require("tidyr")){install.packages("tidyr",dependencies = T);library("tidyr")}
if(!require("rstudioapi")){install.packages("rstudioapi",dependencies = T);library("rstudioapi")}
if(!require("data.table")){install.packages("data.table",dependencies = T);library("data.table")}
if(!require("plyr")){install.packages("plyr",dependencies = T);library("plyr")}
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
rm(list=ls()); cat("\014")

#### 01 Read data ####
fread("junk_data.csv.txt", header = F, sep = ",")
fread("Aword.csv", header = F, sep = ",", quote = "")

