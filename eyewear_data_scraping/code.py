#### 01 Setting Up ####
import requests 
from bs4 import BeautifulSoup 
import csv 
url = "https://www.justdial.com/Madanapalle/Mobile-Shops/nct-11216691"
r = requests.get(url) 
print(r.content) 
soup = BeautifulSoup(r.content, 'html5lib') 
print(soup.prettify())


#### 02 Scraping ####
shop_name_location = ".lng_cont_name"
phone_number_location = ".contact-info"


#### 99 Junk ####
