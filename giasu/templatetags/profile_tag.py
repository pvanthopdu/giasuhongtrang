from django import template
from django.contrib.auth.models import User
from django.apps import apps

register = template.Library()

@register.inclusion_tag('giasu/profile_tag.html', name='profile_tag')
def profile_tag(course):
    teachers = course.course_teachers.all().first()
    content = {
        'teacher': teachers
    }
    return content

