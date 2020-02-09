from django.shortcuts import render
from rest_framework import viewsets
from django.http import JsonResponse, Http404
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import generics
from rest_framework import mixins
from datetime import datetime, timedelta
from django.utils import timezone
from rest_framework import status

from .models import (
    Students,
    Faculty,
    Courses,
    Sections,
    Enrolled,
    attendace_record,
    Hash,
)
from .serializers import (
    StudentsSerializers,
    CreateStudents,
    courseDetailsSerializers,
    FacultySerializers,
    SectionSerializers,
    FindEnrolled,
    attendace_record_serializer,
)


class Login(APIView):
    def user(self, pk, tk):
        try:
            obj = Students.objects.get(email=pk, password=tk)

            return obj
        except Students.DoesNotExist:
            raise Http404

    def post(self, request, formate=None):

        username = request.data["email"]
        password = request.data["password"]

        user = self.user(username, password)
        serializers = StudentsSerializers(user)

        return Response(serializers.data)


class StudentRegistarion(APIView):
    def user(self, pk):
        try:
            return Students.objects.get(email=pk)
        except Students.DoesNotExist:
            raise Http404

    def get(self, request, pk, formate=None):
        use = self.user(pk)
        serializers = StudentsSerializers(use)
        return Response(serializers.data)

    def post(self, request, pk, formate=None):
        serializers = CreateStudents(data=request.data)

        if serializers.is_valid():
            serializers.save()
            return Response(serializers.data, status=201)
        return Response(serializers.errors, status=400)

        # return Response(serializers.data)


class CourseDetailsViewSets(APIView):
    def get(self, request, formate=None):

        queryset = Courses.objects.all()
        serialize = courseDetailsSerializers(queryset)
        return Response(serialize.data)


class SectionsViewSets(APIView):
    def get_objects(self, pk):

        try:
            return Sections.objects.get(id=pk)
        except Sections.DoesNotExist:
            return Http404

    def get(self, request, pk, formate=None):

        sec = self.get_objects(pk)

        serializers = SectionSerializers(sec)
        return Response(serializers.data)


class EnrolledView(generics.ListCreateAPIView):

    queryset = Enrolled.objects.all()
    serializer_class = FindEnrolled

    def find_obj(self, pk):

        try:
            return Enrolled.objects.filter(students_id=pk)
        except Enrolled.DoesNotExist:
            raise Http404

    def post(self, request):

        pk = request.data["student_id"]

        en = self.find_obj(pk)
        serializer = FindEnrolled(en, many=True)
        return Response(serializer.data)


class Attend(APIView):
    def getObj(self, id, sec):

        try:

            user = Enrolled.objects.get(section_id=sec, students_id=id)
            return True
        except:
            return False

    def lastIn(self, mac, student_id, section_id):

        try:

            user = Hash.objects.get(mac=mac)
            return user
        except:
            s = Students.objects.get(enrollment_no=student_id)
            sec = Sections.objects.get(section_id=section_id)
            try:
                user = Hash.objects.get(student_id=student_id)
                user.mac = mac
                return user
            except:
                user = Hash(section_id=sec, student_id=s, mac=mac)
                user.save()
                return user

    def post(self, request, formate=None):

        student_id = request.data["student_id"]
        section_id = request.data["section_id"]
        mac = request.data["mac"]

        ans = self.getObj(student_id, section_id)

        if ans:
            s = Students.objects.get(enrollment_no=student_id)
            sec = Sections.objects.get(section_id=section_id)

            obj = self.lastIn(mac, student_id, section_id)

            if (obj != None) or (obj.student_id != student_id):

                if (obj.time + timedelta(seconds=10)) > timezone.now():
                    rec = attendace_record.objects.create(
                        students_id=s, section_id=sec, attend=True
                    )
                    rec.save()
                    serializer = attendace_record_serializer(rec)
                    return Response(serializer.data)

                elif (obj.time + timedelta(hours=1, minutes=20)) < timezone.now():
                    obj.time = timezone.now()
                    obj.section_id = sec

                    obj.save()

                    rec = attendace_record.objects.create(
                        students_id=s, section_id=sec, attend=True
                    )
                    rec.save()
                    serializer = attendace_record_serializer(rec)
                    return Response(serializer.data)

                else:
                    return Response(
                        {
                            "details": "You are not authorized to attend ,try after some time"
                        },
                        status=status.HTTP_401_UNAUTHORIZED,
                    )
            else:
                return Response(
                    {"details": "You are trying to do proxy"},
                    status=status.HTTP_401_UNAUTHORIZED,
                )
        else:
            return Response(
                {"details": "You are not in this section"},
                status=status.HTTP_401_UNAUTHORIZED,
            )


class Attend_Record(generics.ListCreateAPIView):

    queryset = attendace_record.objects.all()
    serializers_class = attendace_record_serializer

    def getObj(self, pk):

        try:
            return attendace_record.objects.filter(students_id=pk)
        except attendace_record.DoesNotExist:
            return Http404

    def post(self, request):

        user = request.data["student_id"]
        obj = self.getObj(user)

        serializer = attendace_record_serializer(obj, many=True)

        return Response(serializer.data)

