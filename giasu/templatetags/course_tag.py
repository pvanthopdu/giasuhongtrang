from django import template
from django.utils.safestring import mark_safe
from ..models import Course
from ..models import Lesson
from ..models import Review_course
from ..models import Student_Group
from ..forms import CustomGroupForm, CalendarGroupForm
from ..models import Calendar_Group
from datetime import datetime

register = template.Library()


@register.simple_tag(name='teacher_name')
def teacher_name(course):
    name = ""
    # course = Course.objects.get(pk=couse_id)
    teachers = course.course_teachers.all()
    for teacher in teachers:
        name += teacher.gender + ". " + teacher.user.first_name + " " + teacher.user.last_name + "<br>"
    return mark_safe(name)


@register.simple_tag(name='count_student')
def count_student(course):
    # course = Course.objects.get(pk=couse_id)
    return course.course_students.all().count()


@register.inclusion_tag('giasu/result.html', name='teachers')
def tag_incluse(couse_id):
    course = Course.objects.get(pk=couse_id)
    teachers = course.course_teachers.all()
    return {'teachers': teachers}


@register.inclusion_tag('giasu/latest_courses.html', name='latest_courses')
def latest_courses():
    courses = Course.objects.all()[:5]
    return {'courses': courses}


@register.inclusion_tag('giasu/infor_course.html', name='infor_course')
def infor_course(course, review):
    teachers = course.course_teachers.all()
    star = 0
    if review != None:
        star = review.star1
        if review.star2 > star:
            star = review.star2
        if review.star3 > star:
            star = review.star3
        if review.star4 > star:
            star = review.star4
        if review.star5 > star:
            star = review.star5
    cate = course.course_cate
    content = {
        'teachers': teachers,
        'cate': cate,
        'review': star
    }

    return content


@register.inclusion_tag('giasu/course_feature.html', name='course_feature')
def course_feature(course):
    num_lesson = Lesson.objects.filter(lesson_course=course).count()
    num_student = count_student(course)
    teachers = teacher_name(course)
    content = {
        'course': course,
        'teaches': teachers,
        'num_lesson': num_lesson,
        'num_student': num_student
    }
    return content


@register.simple_tag(name='review_course')
def review_course(course):
    review = Review_course.objects.get(course=course)
    return review.get_average_star


@register.inclusion_tag('giasu/group_course.html', name='group_course')
def group_courses(course, path):
    groups = Student_Group.objects.filter(belong_course=course)
    content = {
        'course_id': course.id,
        'coursename': course.course_name,
        'groups': groups,
        'path': path
    }
    return content


@register.inclusion_tag('giasu/add-group-course.html', name='add_group_course')
def add_group_course(course, profile):
    custom_group = CustomGroupForm(initial={'created_by': profile}, course=course)
    content = {
        'header': 'Thêm nhóm học sinh',
        'icon': 'fas fa-plus-circle',
        'custom_group': custom_group
    }
    return content

@register.inclusion_tag('giasu/detail-group.html', name='detail-group')
def detail_group(group, path):
    caledarGroup = Calendar_Group.objects.filter(group_impl= group.group)[:15]
    content = {
        'header': 'Chi tiết nhóm '+group.group.name,
        'icon': 'far fa-list-alt',
        'path': path,
        'group': group,
        'calendarGroup': caledarGroup
    }
    return content


