from django.urls import path, re_path
from . import views

app_name = 'giasu'

urlpatterns = [
    path('', views.index, name='index'),
    path('about/', views.about, name='about'),
    path('users/profile/<int:user_id>', views.profile, name='profile'),
    path('contact/', views.contact, name='contact'),
    path('^news/(?P<url>[\w.:@+-|]+)$', views.news_single, name='news_single'),
    path('courses/addcourse/', views.add_course, name='addcourse'),
    path('courses/edit/<int:course_id>', views.edit_course, name='editcourse'),
    path('courses/lessons/addlesson', views.add_lession, name='addlesson'),
    path('courses/lessons/edit/<int:lesson_id>', views.edit_lesson, name='editlesson'),
    path('courses/lessons/<int:lesson_id>', views.lesson_detail, name='lesson'),
    path('courses/', views.list_course, name='listcourse'),
    path('courses/course/<int:course_id>', views.course_detail, name='course'),
    path('ajax/validate_course_name', views.validate_Course_name, name='validate_course_name'),
    path('ajax/validate_lesson_name', views.validate_Lesson_name, name='validate_lesson_name'),
    path('ajax/validate_group_name', views.validate_group_name, name='validate_group_name'),
    path('courses/course_register_temp/', views.add_register_course_temp,
         name='add_register_course_temp'),
    path('courses/user_register_course/', views.add_register_course_user,
         name='add_register_course_user'),
    path('courses/lessons/answerpractice/', views.answer_practice, name='answer-practice'),
    path('courses/add_group_course', views.add_custom_group, name='add-group-course'),
    path('course/manager_group_course/<int:custom_group_id>',
         views.manager_group_course, name = 'manager-group-course'),
    path('course/delete_group/<int:group_id>', views.delete_group_course,
         name='delete-group'),
    path('course/calendar', views.createcalendar, name='calendar'),
    path('course/getmember', views.getmember, name='getmember'),

]
