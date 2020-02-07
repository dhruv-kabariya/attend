from django.utils import timezone
from time import sleep
from datetime import datetime

t1 = timezone.now()
sleep(30)

print((timezone.now() - t1).seconds)
