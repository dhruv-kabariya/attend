import pyqrcode
# from pyqrcode import QRcode

a =  "12465653826653"

url = pyqrcode.create(a)

url.svg("name1.svg",scale = 8)
# url.svg("name2.svg",scale = 8)
