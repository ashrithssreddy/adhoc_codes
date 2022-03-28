#### 00 Setting up the workspace ####
library('rvest')
library('dplyr')
rm(list=ls()); cat("\014")

#### 01_ISSUE_POOL ####
webpage = read_html('https://www.ets.org/gre/revised_general/prepare/analytical_writing/issue/pool') #Reading the HTML code from the website

instruction_data = html_nodes(webpage,'.indented p') #Using CSS selectors to scrape the rankings section
instruction_data = html_text(instruction_data) #Converting the ranking data to text
instruction_data %>% unique %>% write.table("01_issue_instructions.txt",row.names=FALSE)

# class(instruction_data)
# length(instruction_data)
# head(instruction_data)

question_data = html_nodes(webpage,'.left p') #Using CSS selectors to scrape the rankings section
question_data = html_text(question_data) #Converting the ranking data to text
rm(webpage)

# class(question_data)
# length(question_data)
# head(question_data)

question_data = question_data[question_data %in% instruction_data == F] %>% tail(-2)
question_data = question_data %>% as.data.frame(stringsAsFactors = F) %>% setNames("question")

for(i in 1:nrow(question_data)){
  if(grepl(question_data[i,"question"], pattern =  "Claim")){
    question_data[i,"question_new"] = paste0(c(question_data[i,"question"],question_data[i+1,"question"]),collapse = "---")
  }
}
rm(i,instruction_data)
question_data$question_new = ifelse(is.na(question_data$question_new),question_data$question,question_data$question_new)
question_data = question_data %>% dplyr::filter(!grepl(x = question, pattern = "Reason")) %>% 
  dplyr::mutate(question = NULL)
question_data = question_data %>% unique %>% 
  dplyr::rename(question = question_new) %>% mutate(sl_no = 1:n()) %>% select(sl_no,everything())
question_data %>% openxlsx::write.xlsx("01_issue_questions.xlsx",row.names = F)
rm(question_data)

#### 02_ARGUEMENT_POOL ####
webpage = read_html('https://www.ets.org/gre/revised_general/prepare/analytical_writing/argument/pool') #Reading the HTML code from the website

question_data = html_nodes(webpage,'.left p') #Using CSS selectors to scrape the rankings section
rm(webpage)
question_data = html_text(question_data) #Converting the ranking data to text
# question_data = question_data %>% unique
question_data = question_data %>% as.data.frame()

question_data %>% openxlsx::write.xlsx("02_arguement_questions.xlsx",row.names = F)
rm(question_data)


#### 99_junk ####
if(F){
  test = question_data
  i = 4
  invert = T
  sep="\t",
# test = question_data %>% 
#   mutate(flag = grepl(pattern = "Claim", x = question) | grepl(pattern = "Reason", x = question)) %>% 
#   mutate(question_id = )
  
  # question_data = question_data %>% mutate(sl_no = 1:n(),sl_no = stringr::str_pad(sl_no,3,pad = "0")) %>% 
  #   select(sl_no,everything()) 
  #   
  # # question_data %>% unique %>% write.table("issue_question.txt",row.names=FALSE)
  # sink("issue_questions.txt", type=c("output"),append = T)  # Ensures the glimpse output is written to output_filename text file
  # invisible(question_data %>% pull(question_new) %>% sapply(function(x){
  #   cat(x)
  #   cat("\n");cat("\n")                                 # 2 blank lines at the end of output
  #   invisible()
  # }))
  # sink()
}