



all_files = dir(dir(), recursive = T, full.names = T) %>% 
  as.data.frame(stringsAsFactors = F) %>% 
  setNames("filename") %>% 
  mutate(filename = paste0(getwd(),"/",filename)) %>% 
  mutate(filesize = filename %>% sapply(file.size)) %>% 
  arrange(desc(filesize)) %>% 
  mutate(parent = dirname(filename))


all_files %>% 
  head(10) %>% 
  pull(parent) %>% 
  unique %>% 
  sapply(shell.exec)


