from django.urls import path

from .views import index, login, generateQr, saveAttend

app_name = "faculty"

# urlpatterns
urlpatterns = [
    path("", index, name="index"),
    path("login/", login, name="login"),
    path("generate/", generateQr, name="generateQr"),
    path("save/", saveAttend, name="save"),
]
