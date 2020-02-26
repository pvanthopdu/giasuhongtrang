from django.urls import path
from . import views
from django.contrib.auth.views import LogoutView

app_name = 'accounts'

urlpatterns = [
    path('signup/', views.signup, name='signup'),
    path('login/', views.login, name='login'),
    path('logout/', LogoutView.as_view(next_page='/'), name='logout'),
    path('cpwd/', views.change_password, name='changepwd'),
    path('loginSocial', views.loginSocial, name='loginSocial'),
]
