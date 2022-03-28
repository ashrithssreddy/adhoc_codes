from selenium import webdriver
import time

driver = webdriver.Chrome()
url = "https://www.justdial.com/Madanapalle/Mobile-Shops/nct-11216691"
driver.get(url)
time.sleep(5)


shop_names_html = driver.find_elements_by_css_selector(".lng_cont_name")
all_shop_names = []
for shop_name_html in shop_names_html:
    print(shop_name_html.text)
    all_shop_names.extend([shop_name_html.text])

shop_names_html = driver.find_elements_by_css_selector(".sp-detail")
all_shop_names = []
for shop_name_html in shop_names_html:
    print(shop_name_html.text)
    all_shop_names.extend([shop_name_html.text])











shop_numbers_html = driver.find_elements_by_css_selector(".cont_sw_addr")
shop_numbers_html[0].text
all_shop_numbers = []
for shop_number_html in shop_numbers_html:
    print(shop_number_html.text)
    all_shop_numbers.extend([shop_number_html.text])





elements = driver.find_elements_by_css_selector(".contact-info")
for i in elements:
    print(i.text)