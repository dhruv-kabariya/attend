from django.contrib import admin
from .models import (
    Students,
    Courses,
    Sections,
    Enrolled,
    attendace_record,
    Faculty,
    Hash,
)

# Register your models here.

admin.site.register(Students)
admin.site.register(Faculty)
admin.site.register(Courses)
admin.site.register(Sections)
admin.site.register(Enrolled)
# admin.site.register()
admin.site.register(attendace_record)
admin.site.register(Hash)
