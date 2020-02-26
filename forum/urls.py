from django.urls import path
from . import views

app_name = 'forum'

urlpatterns = [
    path('', views.index, name='index'),
    path('addquestion', views.addQuestion, name='addquestion'),
    path('add_discuss', views.addDiscuss, name='add_discuss'),
    path('questiondetail/<int:id>', views.question_detail, name='questiondetail'),
    path('questions/like', views.addLikeQuestion, name='likequestion'),
    path('discussion/like', views.addLikeDiscussion, name='likeanswer'),
]