import sys

sys.path.append(".")
from generate import generating
from django.shortcuts import render

sys.path.append("..")
from django.shortcuts import redirect, reverse
from apis.models import Faculty, Sections, Hash, Enrolled
from django.http import HttpResponse, JsonResponse

# Create your views here.


def index(request):
    return render(request, "index.html")


def login(request):

    if request.method == "POST":
        username = request.POST["email"]
        passowrd = request.POST["password"]
        try:

            user = Faculty.objects.get(email=username, password=passowrd)
            lectures_list = Sections.objects.filter(faculty_name=user.Fid)

            context = {"user": user, "lectures_list": lectures_list}

            return render(request, "dashbord.html", context)
        except Faculty.DoesNotExist:
            return redirect(index)


def saveAttend(request):
    count = 0

    if request.method == "POST":

        section_id = request.POST["section_id"]
        total = Enrolled.objects.filter(section_id=section_id)
        attend = Hash.objects.filter(section_id=section_id)
        if len(attend) > 1:
            for i in range(len(total)):
                user = total[i]
                real = attend[i]
                if user.students_id == real.student_id:
                    count += 1
                else:
                    rec = attendace_record.objects.create(
                        students_id=total[i].students_id,
                        section_id=section_id,
                        attend=False,
                    )
                    rec.save()
        else:
            count = 0
        context = {"total_student": len(total), "attended": count}
        return JsonResponse(context)


def generateQr(request):

    if request.method == "POST":
        sid = request.POST["sec_id"]
        try:
            obj = Sections.objects.get(section_id=sid)
        except Sections.DoesNotExist:
            return HttpResponse("Not exist")
        w = generating(sid)
        return HttpResponse(w)

    return HttpResponse("hello")

