from django import template
from django.apps import apps
from ..forms import QuestionForm, DiscussForm
from ..models import Discussion

register = template.Library()

@register.inclusion_tag('forum/category.html', name='topic')
def topic():
    Course = apps.get_model('giasu', 'Course')
    courses = Course.objects.all()
    return {'courses': courses}

@register.inclusion_tag('forum/modal_addquestion.html', name='addquestion')
def addquestion():
    questionform = QuestionForm()
    return {'questionform': questionform}

@register.inclusion_tag('forum/modal_adddiscuss.html', name='add_discuss')
def add_discuss(question, user):
    discussForm = DiscussForm({'question':question, 'dis_user':user})
    content = {
        'discussForm': discussForm,
        'question': question
    }
    return content

@register.inclusion_tag('forum/option_lesson.html', name='option_lesson')
def option_lesson(course):
    Lesson = apps.get_model('giasu', 'Lesson')
    lessons = Lesson.objects.filter(lesson_course= course)
    return {'lessons': lessons}

@register.inclusion_tag('forum/collapse_lesson.html', name='collapse_lesson')
def collapse_lesson(course):
    Lesson = apps.get_model('giasu', 'Lesson')
    lessons = Lesson.objects.filter(lesson_course= course)
    return {'lessons': lessons}

@register.inclusion_tag('forum/option_topic_form.html', name='option_topic')
def option_topic():
    Course = apps.get_model('giasu', 'Course')
    topics = Course.objects.all()
    return {'topics': topics}
