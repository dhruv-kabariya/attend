from django.db import models


class Students(models.Model):

    course_choise = [
        ("B.tech", "B.tech"),
        ("MBA", "MBA"),
        ("M.tech", "M.tech"),
        ("BBA", "BBA"),
    ]

    enrollment_no = models.IntegerField(primary_key=True)
    email = models.EmailField(verbose_name="Email", max_length=60, unique=True)
    first_name = models.CharField(max_length=20)
    last_name = models.CharField(max_length=20)
    middle_name = models.CharField(max_length=40)
    course = models.CharField(choices=course_choise, max_length=6)
    programme = models.CharField(max_length=50)
    DOB = models.DateField()
    batch = models.IntegerField()
    password = models.CharField(max_length=256)
    last_login = models.DateTimeField(verbose_name="Last login", auto_now=True)

    def __str__(self):
        return self.first_name + " " + self.last_name


class Faculty(models.Model):

    Fid = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=100)
    password = models.CharField(max_length=256)
    email = models.EmailField()
    room_no = models.IntegerField()
    campus = models.CharField(max_length=10)

    def __str__(self):
        return self.name


class Courses(models.Model):

    course_id = models.IntegerField()
    course_code = models.CharField(max_length=6, primary_key=True)
    course_name = models.CharField(max_length=100)
    no_of_sections = models.IntegerField()
    no_of_lecture = models.IntegerField()

    def __str__(self):
        return self.course_name


class Sections(models.Model):

    faculty_name = models.ForeignKey(Faculty, on_delete=models.CASCADE)
    section_id = models.IntegerField(primary_key=True)
    section_no = models.IntegerField()
    section_time = models.DateTimeField
    course_id = models.ForeignKey(Courses, on_delete=models.CASCADE)
    no_of_intake = models.IntegerField()

    def __str__(self):
        return self.course_id.course_name + " " + str(self.section_no)


class Enrolled(models.Model):

    course_id = models.ForeignKey(Courses, on_delete=models.CASCADE)
    section_id = models.ForeignKey(Sections, on_delete=models.CASCADE)
    students_id = models.ForeignKey(Students, on_delete=models.CASCADE)
    enrolled_date = models.DateTimeField(auto_now=True)


class attendace_record(models.Model):

    date = models.DateTimeField(auto_now_add=True)
    students_id = models.ForeignKey(Students, on_delete=models.CASCADE)
    section_id = models.ForeignKey(Sections, on_delete=models.CASCADE)
    attend = models.BooleanField()
    # mac = models.CharField(max_length=20)


class Hash(models.Model):

    student_id = models.ForeignKey(Students, on_delete=models.CASCADE)
    section_id = models.ForeignKey(Sections, on_delete=models.CASCADE)
    mac = models.CharField(max_length=256, unique=True)
    time = models.DateTimeField(auto_now_add=True)
