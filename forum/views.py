from django.apps import apps
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from django.http import HttpResponseRedirect, JsonResponse
from django.shortcuts import render
from .models import Question, Discussion
from .forms import QuestionForm, DiscussForm
from django.utils.encoding import force_str
# Create your views here.


# function view index
def index(request):
    questions = Question.objects.all().order_by('-time')
    # Question.objects.filter(content__exact=t=)
    if request.method == 'POST':
        search_question = request.POST.get('search_question', None)
        search_topic = request.POST.get('topic')
        print(force_str(search_question, encoding='utf-8'))
        if search_question != '':
            questions = questions.filter(content__icontains= search_question)
        if search_topic != 'Chọn chủ đề':
            questions = questions.filter(topic__lesson_name= search_topic)
    topic = request.GET.get('topic')
    if topic!=None:
        questions = questions.filter(topic__lesson_name= topic)

    page = request.GET.get('page', 1)
    paginator = Paginator(questions, 5)

    try:
        questions = paginator.get_page(page)
    except PageNotAnInteger:
        questions = paginator.get_page(1)
    except EmptyPage:
        questions = paginator.get_page(paginator.num_pages)

    content = {
        'questions': questions,
    }
    return render(request, 'forum/index.html', content)

@login_required
def addQuestion(request):
    if request.method == 'POST':
        topic = request.POST.get('topic', None)
        content = request.POST.get('content', None)
        if content=="":
            messages.error(request, "Nội dung câu hỏi trống")
        else:
            Lesson = apps.get_model('giasu', 'Lesson')
            question = Question(
                topic= Lesson.objects.get(pk=topic),
                content=content,
                user= request.user.profile
            )
            question.save()
            messages.success(request, "Gởi câu hỏi thành công")
    return HttpResponseRedirect('/forum')

@login_required
def addDiscuss(request):
    if request.method == 'POST':
        discuss = DiscussForm(request.POST, request.FILES)
        if discuss.is_valid():
            discuss.save()
            messages.success(request, "Đã gởi thảo luận thành công!")
        else:
            messages.error(request, discuss.errors)
    return HttpResponseRedirect("/forum/")

def question_detail(request, id):
    question = Question.objects.get(pk=id)
    question.view = question.view + 1
    question.save()
    reviews = Discussion.objects.filter(question= question).order_by('-like')
    page = request.GET.get('page', 1)
    paginator = Paginator(reviews, 5)

    try:
        reviews = paginator.get_page(page)
    except PageNotAnInteger:
        reviews = paginator.get_page(1)
    except EmptyPage:
        reviews = paginator.get_page(paginator.num_pages)
    content = {
        'question': question,
        'reviews': reviews
    }
    return render(request, 'forum/question_detail.html', content)

def addLikeQuestion(request):
    question_id = request.POST.get('question_id')
    question = Question.objects.get(pk=question_id)
    likes = question.like + 1
    question.like = likes
    question.save()
    data = {
        'likes': likes,
    }
    return JsonResponse(data)

def addLikeDiscussion(request):
    discussion_id = request.POST.get('discussion_id')
    discussion = Discussion.objects.get(pk=discussion_id)
    likes = discussion.like + 1
    discussion.like = likes
    discussion.save()
    data = {
        'likes': likes,
    }
    return JsonResponse(data)