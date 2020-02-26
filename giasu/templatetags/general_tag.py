from django import template
from ..getcontentRSS import ReadconentRSS
from ..models import Course
from ..models import Lesson
from ..models import Review_course
from ..models import DoPractice
from ..forms import Do_practiceForm
from ..models import LibraryImage
from django.apps import apps
import math

register = template.Library()
@register.inclusion_tag('giasu/block_news_education.html', name='block_news_education')
def block_news_education():
    # ReadconentRSS.getCateNewsFeed()
    cateNews = ReadconentRSS.getCateNewsFeed()
    cateFirst = cateNews.pop(0)
    content = {
        'cateFirst': cateFirst,
        'cateNews': cateNews
    }
    return content

def keySort(key):
    return key['star']
@register.inclusion_tag('giasu/block_popularCourses.html', name='block_popularCourses')
def block_popularCourses():
    list_course = list()
    review_courses = Review_course.objects.all();
    for review_course in review_courses:
        item_list = {
            'course': review_course.course,
            'teacher': review_course.course.course_teachers.first(),
            'star': review_course.get_average_star
        }
        list_course.append(item_list)
    list_course.sort(reverse=True, key= keySort)
    return {'courses': list_course[:4]}

@register.inclusion_tag('giasu/pupup_registerCourse_ajax.html', name='pupup_registerCourse')
def pupup_registerCourse():
    courses = Course.objects.all()
    return {'courses': courses}

@register.inclusion_tag('giasu/block_tearm.html', name='block_team')
def block_team():

    Profile = apps.get_model('accounts','Profile')#get app from other model
    teachers = Profile.objects.filter(role=2).order_by('-point')[:4]
    return {'teachers': teachers}

@register.inclusion_tag('giasu/block_lessons.html', name='block_lessons')
def block_lessons(course, user_id, profile_id):
    lessons = Lesson.objects.filter(lesson_course= course)
    isEdit = False
    if user_id == profile_id:
        isEdit = True
    content={
        'lessons': lessons,
        'isEdit': isEdit
    }
    return content

@register.inclusion_tag('giasu/select_major.html', name='major')
def select_major(major_user):
    Major = apps.get_model('accounts','Major')
    majors = Major.objects.all()
    content={
        'majors': majors,
        'major_user':major_user
    }
    return content

@register.inclusion_tag('giasu/pupup_registryCourse_User.html', name='user_register_course')
def user_register_course(user):
    Profile = apps.get_model('accounts', 'Profile')  # get app from other model
    profile = Profile.objects.get(user = user)
    courses_user = Course.objects.exclude(course_students = profile)
    return {'courses': courses_user}

@register.inclusion_tag('giasu/user_do_practice.html', name='user_do_practice')
def user_do_practice(user, practice):
    Profile = apps.get_model('accounts', 'Profile')  # get app from other model
    profile = Profile.objects.get(user = user)
    try:
        do_practice = DoPractice.objects.get(user=profile, practice=practice)
        form = Do_practiceForm(initial={'answer': do_practice.answer})
    except:
        form = Do_practiceForm()
    content = {
        'practice_id': practice.id,
        'form':form
    }
    return content

@register.inclusion_tag('giasu/gallery.html', name='gallery')
def gallery():
    images = LibraryImage.objects.all().order_by('?')[:6]
    return {'images': images}

@register.simple_tag(name='ceil')
def ceil(number):
    return math.ceil(number/2)

@register.simple_tag(name='idvideo-youtube')
def idvideo(url):
    item = url.split("=")
    return item[1]

@register.simple_tag(name='checkEdit')
def checkEdit(user_id, profile_id):
    if user_id == profile_id:
        return True
    else:
        return False