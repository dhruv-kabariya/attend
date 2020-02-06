from django.urls import path, include
from rest_framework import routers
from rest_framework.urlpatterns import format_suffix_patterns
from .views import (
    StudentRegistarion,  
    SectionsViewSets, 
    EnrolledView,
    Login,
    Attend,
    Attend_Record
    )
app_name = 'apis'


route = routers.DefaultRouter()

urlpatterns = [
    
    path('login/',Login.as_view()),
    
    path('enrolled/', EnrolledView.as_view()),
    path('attend/',Attend.as_view()),
    path('records/',Attend_Record.as_view())
    # path('logout/',logout.as_view()),
]

