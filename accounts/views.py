from urllib.request import urlopen

import requests
from django.contrib.auth.decorators import login_required
from django.core.files.base import ContentFile
from django.http import response
from django.http.response import JsonResponse, HttpResponseRedirect
from django.shortcuts import render, redirect
from requests import HTTPError
from social_core.utils import slugify
from social_django.models import UserSocialAuth

from .forms import *
from django.contrib import messages
from django.contrib.auth import authenticate, login as auth_login
from datetime import datetime


# Create your views here.
def signup(request):
    if request.method == 'POST':
        user = SignUpForm(request.POST)
        if user.is_valid():
            obj = user.save()
            if obj:
                messages.info(request, "You are already register account successfully!")
                return redirect('accounts:login')

    else:
        user = SignUpForm()
    return render(request, 'accounts/signup.html', {'signup': user})


def login(request):
    nextpage = request.GET.get('next', '/')
    request.session['nextpage_login'] = nextpage
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(request, username=username, password=password)
        if user is not None:
            auth_login(request, user)
            messages.info(request, "You are already login successfully.")
            return redirect(nextpage)

        messages.error(request, "Please enter a correct username and password.")
    return render(request, 'accounts/login.html')


def change_password(request):
    password = request.POST.get('password');
    user = request.user
    user.set_password(password)
    user.save()
    data = {
        'status': True,
        'messages': 'Update password successsfully!'
    }
    return JsonResponse(data)


@login_required
def loginSocial(request):
    user = request.user
    try:
        facebook_login = user.social_auth.get(provider='facebook')
    except UserSocialAuth.DoesNotExist:
        facebook_login = None

    try:
        google_login = user.social_auth.get(provider='google-oauth2')
    except UserSocialAuth.DoesNotExist:
        google_login = None

    if facebook_login!= None:
        url = 'http://graph.facebook.com/' + facebook_login.extra_data['id'] + '/picture?type=large'
        profile = facebook_login.user.profile
        # save image avatar for user
        avatar = urlopen(url)
        profile.image.save(slugify(profile.user.username + " social") + '.jpg',
                           ContentFile(avatar.read()))
        profile.birthdate = datetime.strptime(facebook_login.extra_data['birthday'], '%m/%d/%Y')
        profile.save()

        # update email
        facebook_login.user.email = facebook_login.extra_data['email']
        facebook_login.user.save()
        return redirect('giasu:profile', user_id=facebook_login.user.id)
    elif google_login !=None:
        return redirect('giasu:profile', user_id=google_login.user.id)
