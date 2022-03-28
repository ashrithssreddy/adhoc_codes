from selenium import webdriver
import time

driver = webdriver.Chrome()
url = "https://www.justdial.com/Madanapalle/Sangeetha-Mobiles-Opposite-Mohan-Dental-Hospital-CTM-Road/9999P8571-8571-160614120820-W9B7_BZDET?xid=TWFkYW5hcGFsbGUgTW9iaWxlIFNob3Bz"
driver.get(url)
time.sleep(5)

shop_names_html = driver.find_elements_by_css_selector("#comp-contact .mtel")
type(shop_names_html)                                                       
len(shop_names_html)                                                       
type(shop_names_html[0])                                                       
shop_names_html[0].text

shop_names_html = driver.find_element_by_css_selector(".telCntct .mtel")
shop_names_html.text
type(shop_names_html)                                                       
len(shop_names_html)                                                       
type(shop_names_html[0])                                                       
shop_names_html[0].text


