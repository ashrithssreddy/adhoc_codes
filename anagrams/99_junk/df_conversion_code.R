library("tidyr")
library("dplyr")

df = data.frame(a = c(11,12,13), b = c(14,15,16), c = c(17,18,19))
col_melt = ncol(df)

df = df %>% 
  mutate(index = 1:n())

data.frame(col1 = unlist(c(select(df, 1:col_melt))), index = rep(df$index, col_melt)) %>% 
  arrange(index) %>% 
  select(col1)



