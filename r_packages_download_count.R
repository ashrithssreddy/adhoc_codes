rm(list=ls()) ; cat("\014");
setwd("C:\\Users\\Ashrith\\Desktop\\SO Tags\\top_r_packages")
if(!require("rvest")){install.packages("rvest");library("rvest");}
if(!require("RJSONIO")){install.packages("RJSONIO");library("RJSONIO");}

url  = "https://cran.r-project.org/web/packages/available_packages_by_name.html"
webpage = read_html(url)
webpage_html = html_nodes(webpage,'td a')
package_list = html_text(webpage_html)

start_time = Sys.time()
df=data.frame(package_name=package_list)
for(i in 1:length(package_list) ){
  
  url = paste0("https://cranlogs.r-pkg.org/downloads/total/1997-01-01:",format(Sys.time(),"%Y-%m-%d"),"/",package_list[i])
  raw= unlist( RJSONIO::fromJSON(url) )
  df[i,"start"] = raw["start"]
  df[i,"end"] = raw["end"]
  df[i,"downloads"] = raw["downloads"]
  df[i,"package"] = raw["package"]
  print(i)
}
df$downloads = as.numeric(df$downloads)
end_time = Sys.time()
total_time_taken = (start_time-end_time)
print(total_time_taken)

write.xlsx(df,"R_packages_17_05_2017.xlsx")