from django.http import HttpResponseRedirect
from django.contrib import messages
from .models import Student_Group

def isteacherOfCourse(user, course):
    teachers = course.course_teachers.all()
    for teacher in teachers:
        if teacher.user.id == user.id:
            return True
    return False

def permit_calendar(function):
    def wrap(request, *args, **kwargs):
        nextpage = request.GET.get('next')
        custom_group = Student_Group.objects.get(pk=kwargs['custom_group_id'])
        if not request.user.is_authenticated:
            messages.error(request, "Bạn chưa đăng nhập")
        elif custom_group.created_by.user == request.user \
                or request.user.is_superuser\
                or isteacherOfCourse(request.user, custom_group.belong_course):
            return function(request, *args, **kwargs)
        else:
            messages.error(request,"Bạn không có quyền với chức năng này")
        return HttpResponseRedirect(nextpage)

    wrap.__doc__ = function.__doc__
    wrap.__name__ = function.__name__
    return wrap

def permit_group(function):
    def wrap(request, *args, **kwargs):
        nextpage = request.GET.get('next')
        custom_group = Student_Group.objects.get(group__id=kwargs['group_id'])
        if not request.user.is_authenticated:
            messages.error(request, "Bạn chưa đăng nhập")
        elif custom_group.created_by.user == request.user \
                or request.user.is_superuser \
                or isteacherOfCourse(request.user, custom_group.belong_course):
            return function(request, *args, **kwargs)
        else:
            messages.error(request,"Bạn không có quyền với chức năng này")
        return HttpResponseRedirect(nextpage)

    wrap.__doc__ = function.__doc__
    wrap.__name__ = function.__name__
    return wrap