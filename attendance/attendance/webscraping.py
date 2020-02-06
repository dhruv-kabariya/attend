from bs4 import BeautifulSoup as soup
from urllib.request import urlopen, Request
import time

search = input()
mu_url = "https://www.amazon.in/s?k="+search+"&ref=nb_sb_noss"

req = Request(mu_url)

page_code = urlopen(mu_url)
code = page_code.read()

page_code.close()
page_soup = soup(code, 'html.parser')
divs = page_soup.findAll(
    "div", {"class": "a-section a-spacing-medium"})

photo_links = []
# print(divs[2])
for i in divs:
    link = i.findAll(
        "img")
    # photo = link["src"]
    photo_links.append(link[0]["src"])

print(photo_links[1])
