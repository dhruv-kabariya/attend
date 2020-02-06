import sys

sys.path.append(".")
from generate import generating
from django.shortcuts import render

sys.path.append("..")
from django.shortcuts import redirect, reverse
from apis.models import Faculty, Sections, Hash
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

    if request.method == "POST":

        section_id = request.POST["section_id"]
        total = Sections.objects.get(section_id=section_id).no_of_intake
        attend = Hash.objects.filter(section_id=section_id).count()

        context = {"total_student": total, "attended": attend}
        return JsonResponse(context)


def generateQr(request):

    if request.method == "POST":
        sid = request.POST["sec_id"]
        w = generating(sid)
        return HttpResponse(w)

    return HttpResponse("hello")

