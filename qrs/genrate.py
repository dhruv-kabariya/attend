import pyqrcode
from datetime import datetime

a = 'fcp101_'
t1 = datetime.timestamp(datetime.now())
for i in range(500):
    temp = a + str(datetime.timestamp(datetime.now()))
    temp_qr = pyqrcode.create(temp)
    temp_qr.svg(temp + ".svg",scale = 10)
t2 = datetime.timestamp(datetime.now())

print("Done")
print(t1)
print(t2)
print(t2-t2)