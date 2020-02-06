from rest_framework import serializers

from .models import Students, Faculty, Enrolled, Courses, Sections, attendace_record


class StudentsSerializers(serializers.ModelSerializer):
    class Meta:
        model = Students
        fields = ["email", "enrollment_no", "first_name",
                  "last_name", "middle_name", "batch", "course"]


class FacultySerializers(serializers.HyperlinkedModelSerializer):

    
    class Meta:
        model = Faculty
        fields = "__all__"


class CreateStudents(serializers.ModelSerializer):

    class Meta:

        model = Students
        fields = ["email", "enrollment_no", "first_name",
                  "last_name", "middle_name", "batch", "course"]
        extra_keargs = {
            "password": {'write_only': True}
        }

        def save(self):

            password = self.validated_data["password"]

            student = Students(
                email=self.validated_data["email"],
                password=self.validated_data["password"],
                enrollment_no=self.validated_data['enrollment_no'],
                first_name=self.validated_data["first_name"],
                last_name=self.validated_data["last_name"],
                middle_name=self.validated_data["middle_name"],
                batch=self.validated_data["batch"],
                course=self.validated_data['course']
            )
            student.save()
            return student


class FindEnrolled(serializers.ModelSerializer):



    class Meta:
        model = Enrolled
        fields = "__all__"
        depth = 2


class courseDetailsSerializers(serializers.HyperlinkedModelSerializer):

   

    class Meta:
        model = Courses
        fields = ['course_id', 'course_code', 'course_name']


class SectionSerializers(serializers.ModelSerializer):

    
    class Meta:
        model = Sections
        fields = "__all__"
        depth = 1

class attendace_record_serializer(serializers.ModelSerializer):

    class Meta:
        model = attendace_record
        fields = "__all__"
        