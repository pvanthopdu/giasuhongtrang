from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from django.http import HttpResponseRedirect
from django.shortcuts import render, get_object_or_404, redirect
from django.core.exceptions import ObjectDoesNotExist
from django.contrib.auth.models import Group
from django.forms import inlineformset_factory
from datetime import datetime, timedelta, date

from django.utils.safestring import mark_safe

from .decorators import *
from .calendar import Calendar
from .getContentHTML import ReadContentHTML
from .forms import CourseForm
from .models import Course
from .models import Lesson
from .models import Practice
from .models import DoPractice
from .models import Review_lesson
from .forms import LessonForm
from .models import Review_course
from .models import Register_Course_Temp
from .models import Register_course
from .models import Contact
from .models import Student_Group
from .forms import CustomGroupForm, GroupForm, CalendarGroupForm
from .models import Calendar_Group
from django.apps import apps
import re
from django.utils.datastructures import MultiValueDictKeyError
from django.http import JsonResponse
from django.contrib import messages
import json

from .send_mail import *


# function view index
def index(request):
    return render(request, 'giasu/index.html')


# function view about
def about(request):
    return render(request, 'giasu/about.html')


# function view contact
def contact(request):
    if request.method == 'POST':
        name_contact = request.POST.get('name_contact')
        phone_contact = request.POST.get('phone_contact')
        email_contact = request.POST.get('email_contact')
        msg_contact = request.POST.get('msg_contact')
        if not re.match(r'^0[0-9]{9}$', phone_contact):
            messages.error(request, "Số điện thoại chưa hợp lệ")
        else:
            record_contact = Contact(
                name_contact=name_contact,
                phone_contact=phone_contact,
                email_contact=email_contact,
                msg_contact=msg_contact
            )
            record_contact.save()
            messages.success(request,
                             "Bạn đã gởi thư liên hệ thành công. Chúng tôi sẽ liên hệ với bạn sớm nhất.")
            return HttpResponseRedirect('/')

    return render(request, 'giasu/contact.html')


# function view profile
def profile(request, user_id):
    nextpage = request.session.get('nextpage_login')
    if nextpage != None:
        del request.session['nextpage_login']

    Profile = apps.get_model('accounts', 'Profile')
    Major = apps.get_model('accounts', 'Major')
    profile_user = Profile.objects.get(pk=user_id)
    teaching = Course.objects.filter(course_teachers=profile_user)
    learning = Course.objects.filter(course_students=profile_user)
    content = {
        'profile': profile_user,
        'teaching': teaching,
        'learning': learning,
        'nextpage': nextpage
    }
    if request.method == 'POST':
        firstname = request.POST.get('firstname')
        lastname = request.POST.get('lastname')
        birthday = request.POST.get('birthday')
        gender = request.POST.get('gender')
        location = request.POST.get('location')
        email = request.POST.get('email')
        major = request.POST.get('major')
        major = Major.objects.get(name_major=major)
        try:
            image = request.FILES['image']
        except MultiValueDictKeyError:
            image = None

        infor = request.POST.get('infor')
        if firstname != profile_user.user.first_name:
            profile_user.user.first_name = firstname
        if lastname != profile_user.user.last_name:
            profile_user.user.last_name = lastname
        if birthday != profile_user.birthdate:
            profile_user.birthdate = birthday
        if gender != profile_user.gender:
            profile_user.gender = gender
        if location != profile_user.location:
            profile_user.location = location
        if email != profile_user.user.email:
            profile_user.user.email = email
        if major != profile_user.major:
            profile_user.major = major
        if image != None:
            profile_user.image = image
        if infor != profile_user.infor:
            profile_user.infor = infor
        profile_user.save()
        messages.success(request, "Update information your self successfully!")
        if nextpage != None:
            return HttpResponseRedirect(nextpage)
        return HttpResponseRedirect("/users/profile/" + str(profile_user.user.id))

    return render(request, 'giasu/profile_user.html', content)


# function view news_single
def news_single(request, url):
    articleDetail = ReadContentHTML(url)
    content = {
        'title': articleDetail.getTitle(),
        'datepub': articleDetail.getDatepub(),
        'inners': articleDetail.getInner_article(),
        'articleContent': articleDetail.getArticleContent()
    }
    return render(request, 'giasu/news_single.html', content)


# function add record in Register_Course_Temp
def add_register_course_temp(request):
    name_register = request.GET.get('name_register')
    phone_register = request.GET.get('phone_register')
    course_register = request.GET.get('course_register')
    msg_register = request.GET.get('msg_register')
    record_register = Register_Course_Temp(name_register=name_register,
                                           phone_register=phone_register,
                                           course_register=Course.objects.get(course_name__exact=course_register),
                                           msg_register=msg_register)
    record_register.save()
    # send mail to admin
    recipient_list = ['pvantho@gmail.com', ]
    content_mail = {
        'name_register': name_register,
        'phone_register': phone_register,
        'course_register': course_register,
        'msg_register': msg_register
    }
    send_mail_register(recipient_list, content_mail)

    data = {
        'isSave': True,
        'messages': "Bạn đã đăng ký khóa học thành công. Chúng tôi sẽ liên hệ với bạn sớm nhất có thể"
    }
    return JsonResponse(data)


# function user register course
def add_register_course_user(request):
    coursename = request.POST.get('course')
    course = Course.objects.get(course_name=coursename)
    Profile = apps.get_model('accounts', 'Profile')
    profile_user = Profile.objects.get(user=request.user)
    if Register_course.objects.filter(user_register=profile_user, course_register=course).exists():
        status = False
        messages = 'Bạn đã đăng ký khóa học này. Chúng tôi sẽ sớm xem xét duyệt cho bạn'
    else:
        register_course = Register_course(
            user_register=profile_user,
            course_register=course
        )
        register_course.save()
        status = True
        messages = 'Bạn đã đăng ký khóa học thành công! Chúng tôi sẽ sớm xem xét duyệt cho bạn'
    data = {
        'status': status,
        'messages': messages
    }
    return JsonResponse(data)


# function view form add course
def add_course(request):
    header = "Add course"
    course = CourseForm()
    content = {
        'header': header,
        'course': course
    }
    if request.method == 'POST':
        course = CourseForm(request.POST, request.FILES)
        if course.is_valid():
            course.save()
            messages.success(request, "Add course into database successfully!")
            return HttpResponseRedirect("/users/profile")
        else:
            messages.error(request, "Add this course have errors.")

    return render(request, 'giasu/addcourse.html', content)


# function view form edit course
def edit_course(request, course_id):
    course = Course.objects.get(pk=course_id)
    header = "Edit course"
    courseform = CourseForm(instance=course)
    content = {
        'header': header,
        'course': courseform
    }
    if request.method == 'POST':
        courseform = CourseForm(request.POST, request.FILES)
        if courseform.has_changed():
            if courseform.is_valid():
                course.course_name = courseform.cleaned_data['course_name']
                course.course_description = courseform.cleaned_data['course_description']
                course.course_target = courseform.cleaned_data['course_target']
                course.course_require = courseform.cleaned_data['course_require']
                course.course_image = courseform.cleaned_data['course_image']
                course.course_duration = courseform.cleaned_data['course_duration']
                course.course_status = courseform.cleaned_data['course_status']
                course.course_price = courseform.cleaned_data['course_price']
                course.course_cate = courseform.cleaned_data['course_cate']
                course.course_teachers = courseform.cleaned_data['course_teachers']
                course.course_students = courseform.cleaned_data['course_students']
                course.save()
                messages.success(request, "Edit this course successfully!")
            else:
                messages.error(request, "Edit this course have errors.")

    return render(request, 'giasu/addcourse.html', content)


# function view form add lession
def add_lession(request):
    header = "Add lession"
    lesson = LessonForm()
    content = {
        'header': header,
        'lesson': lesson
    }
    if request.method == 'POST':
        lessonform = LessonForm(request.POST, request.FILES)
        if lessonform.is_valid():
            obj = lessonform.save()
            if obj:
                messages.success(request, "Add lesson into database successfully!")
                return HttpResponseRedirect("/users/profile")
        else:
            messages.error(request, "Add this lesson have errors.")

    return render(request, 'giasu/addlesson.html', content)


# function view form edit lesson
def edit_lesson(request, lesson_id):
    lesson = Lesson.objects.get(pk=lesson_id)
    header = "Edit course"
    lessonform = LessonForm(instance=lesson)
    content = {
        'header': header,
        'lesson': lessonform
    }
    if request.method == 'POST':
        lessonform = LessonForm(request.POST, request.FILES)
        if lessonform.has_changed():
            if lessonform.is_valid():
                lesson.lesson_name = lessonform.cleaned_data['lesson_name']
                lesson.lesson_recap = lessonform.cleaned_data['lesson_recap']
                lesson.lesson_target = lessonform.cleaned_data['lesson_target']
                lesson.lesson_detail = lessonform.cleaned_data['lesson_detail']
                lesson.lesson_image = lessonform.cleaned_data['lesson_image']
                lesson.lesson_doc = lessonform.cleaned_data['lesson_doc']
                lesson.lesson_video = lessonform.cleaned_data['lesson_video']
                lesson.lesson_course = lessonform.cleaned_data['lesson_course']
                lesson.lesson_order = lessonform.cleaned_data['lesson_order']
                lesson.lesson_status = lessonform.cleaned_data['lesson_status']
                lesson.save()
                messages.success(request, "Edit this lesson successfully!")
            else:
                messages.error(request, "Edit this lesson have errors.")

    return render(request, 'giasu/addlesson.html', content)


# function view lesson
def lesson_detail(request, lesson_id):
    lesson = get_object_or_404(Lesson, pk=lesson_id)
    review = None
    practice = None
    try:
        review = Review_lesson.objects.filter(lesson=lesson)
        practice = Practice.objects.filter(pratice_lesson=lesson)
    except Review_lesson.DoesNotExist:
        review = None
    except Practice.DoesNotExist:
        practice = None
    content = {
        'reviews': review,
        'lesson': lesson,
        'practices': practice,
    }
    return render(request, 'giasu/lesson.html', content)


# function view list course
def list_course(request):
    courses = Course.objects.all()
    if request.method == 'POST':
        search_course = request.POST.get('search_course')
        search_cate = request.POST.get('select_cate')

        if search_cate != 'Chọn danh mục khóa học':
            courses = courses.filter(course_cate__cate_name=search_cate)
        if search_course != None:
            courses = courses.filter(course_name__icontains=search_course)

    cate = request.GET.get('cate')
    if cate != None:
        courses = courses.filter(course_cate__cate_name=cate)
    page = request.GET.get('page', 1)
    paginator = Paginator(courses, 6)

    try:
        courses = paginator.get_page(page)
    except PageNotAnInteger:
        courses = paginator.get_page(1)
    except EmptyPage:
        courses = paginator.get_page(paginator.num_pages)

    content = {
        'courses': courses,
    }
    return render(request, 'giasu/listcourse.html', content)


# function view course
def course_detail(request, course_id):
    course = get_object_or_404(Course, pk=course_id)
    try:
        review = Review_course.objects.get(course=course)
        lessons = Lesson.objects.filter(lesson_course=course).order_by('lesson_order')
    except ObjectDoesNotExist:
        review = None
        lessons = None
    content = {
        'course': course,
        'review': review,
        'lessons': lessons
    }
    return render(request, 'giasu/course.html', content)


# function validate name course
def validate_Course_name(request):
    course_name = request.GET.get('course_name', None)
    data = {
        'is_course': Course.objects.filter(course_name__iexact=course_name).exists()
    }
    if data['is_course']:
        data['error_message'] = "Course with this Course name already exists."
    return JsonResponse(data)


# function validate name lesson
def validate_Lesson_name(request):
    lesson_name = request.GET.get('lesson_name', None)
    data = {
        'is_lesson': Lesson.objects.filter(lesson_name__iexact=lesson_name).exists()
    }
    if data['is_lesson']:
        data['error_message'] = "Lesson with this lesson name already exists."
    return JsonResponse(data)


# function validate name group
def validate_group_name(request):
    group_name = request.GET.get('group_name', None)
    enableAdd = False
    if group_name.strip() == '':
        message = "Tên nhóm không được trống."
    else:
        if Group.objects.filter(name__iexact=group_name).exists():
            message = "Tên nhóm đã tồn tại."
        else:
            enableAdd = True
            message = ""
    data = {
        'enableadd': enableAdd,
        'message': message
    }
    return JsonResponse(data)


# add answer practie
def answer_practice(request):
    answer = request.POST.get('answer')
    practice_id = request.POST.get('practice_id')
    practice = Practice.objects.get(pk=practice_id)
    Profile = apps.get_model('accounts', 'Profile')  # get app from other model
    profile = Profile.objects.get(user=request.user)
    do_practice = DoPractice(
        user=profile,
        practice=practice,
        answer=answer
    )
    do_practice.save()

    data = {
        'status': True,
        'messages': 'Bài tập của bạn đã được nộp. Giáo viên khóa học sẽ kiểm tra cho bạn sau.'
    }
    return JsonResponse(data)


# add custom group, group
def add_custom_group(request):
    group_name = request.POST.get('group_name')
    student_group_str = request.POST.get('student_group')
    belong_course_id = request.POST.get('belong_course_id')
    Profile = apps.get_model('accounts', 'Profile')
    created_by = Profile.objects.get(user=request.user)
    day_calendars = request.POST.get('day_calendar')
    time_starts = request.POST.get('time_starts')
    time_ends = request.POST.get('time_ends')
    message = ''
    date_created = datetime.now()
    # create group
    group = Group(name=group_name)
    group.save()
    # create custom group
    custom_group = Student_Group(
        group=group,
        created_by=created_by,
        date_created=date_created,
        belong_course=Course.objects.get(pk=belong_course_id)
    )
    custom_group.save()
    if student_group_str != '':
        student_group_str = student_group_str.split(',')
        for student_id in student_group_str:
            student = Profile.objects.get(pk=int(student_id))
            custom_group.member.add(student)
        custom_group.save()

    # create calendar group
    if day_calendars != '':
        days = day_calendars.split(',')
        time_starts = time_starts.split(',')
        time_ends = time_ends.split(',')
        for i in range(0, len(days)):
            calendar_group = Calendar_Group(
                day=days[i],
                start_time=datetime.strptime(time_starts[i], '%H:%M').time(),
                end_time=datetime.strptime(time_ends[i], '%H:%M').time(),
                group_impl=group
            )
            if check_dup_calendar(calendar_group):
                message = "Tuy nhiên, có lịch học trùng với lịch học đã có"
            else:
                calendar_group.save()

    data = {
        'isSave': True,
        'messages': "Bạn đã nhóm thành công.̉" + message
    }
    return JsonResponse(data)


# test the duplication of calendar group
def check_duplicate(schedule1, schedule2):
    if (schedule1.start_time >= schedule2.start_time and schedule1.end_time <= schedule2.end_time) \
            or (schedule1.start_time >= schedule2.start_time and schedule1.start_time < schedule2.end_time) \
            or (schedule1.end_time > schedule2.start_time and schedule1.end_time <= schedule2.end_time):
        return True
    else:
        return False


def check_dup_calendar(calendar):
    calendars = Calendar_Group.objects.filter(day=calendar.day,
                                              group_impl=calendar.group_impl)
    for item in calendars:
        if check_duplicate(calendar, item):
            return True
    return False

@permit_calendar
def manager_group_course(request, custom_group_id):
    nextpage = request.GET.get('next', '/')

    studentgroup = Student_Group.objects.get(pk=custom_group_id)
    groupform = GroupForm(request.POST or None,
                          instance=studentgroup.group)
    # inline formset student group
    studentform = CustomGroupForm(request.POST or None,
                                  course=studentgroup.belong_course,
                                  instance=studentgroup)
    # inline formset calendar
    # filter list day >= now()-0
    dayfilter = datetime.now()
    dayfilter = dayfilter + timedelta(days=-10)
    list_calendar = Calendar_Group.objects.filter(group_impl=studentgroup.group,
                                                  day__gte=dayfilter)
    CalendarFormset = inlineformset_factory(parent_model=Group,
                                            model=Calendar_Group,
                                            form=CalendarGroupForm, can_delete=True, extra=0)
    calendarformset = CalendarFormset(request.POST or None,
                                      prefix='calendar',
                                      queryset=list_calendar,
                                      instance=studentgroup.group,
                                      form_kwargs={'member': studentgroup.member})

    if request.method == 'POST':
        if groupform.is_valid() and studentform.is_valid() and calendarformset.is_valid():
            if groupform.has_changed():
                groupform.save()
                messages.success(request, "Cập nhật tên nhóm thành công")
            if studentform.has_changed():
                studentform.save()
                messages.success(request, "Cập nhật thành viên nhóm thành công")
            if calendarformset.has_changed():
                calendarformset.save()
                messages.success(request, "Lịch học đã được cập nhật thành công")

            return HttpResponseRedirect(nextpage)
        else:
            messages.error(request, "Lỗi")

    content = {
        'header': "Edit nhóm của khóa học",
        'groupform': groupform,
        'studentform': studentform,
        'calendarformset': calendarformset
    }

    return render(request, 'giasu/manager_group_course.html', content)

@permit_group
def delete_group_course(request, group_id):
    nextpage = request.GET.get('next', '/');
    group = Group.objects.get(pk=group_id)
    groupstudent = Student_Group.objects.get(group=group)
    group.delete()
    messages.success(request, "Nhóm " + group.name + " đã được xáo khỏi khóa học "
                     + groupstudent.belong_course.course_name)
    return HttpResponseRedirect(nextpage)

# function get member of group course
def getmember(request):
    group_id = request.GET.get('group_id')
    student_group = Student_Group.objects.get(pk = group_id)
    members = student_group.member.all()
    datamember = list()
    for member in members:
        item = {
            'id': member.id,
            'value': member.get_full_name
        }
        datamember.append(item)
    data = {
        'is_success': True,
        'members': datamember
    }
    return JsonResponse(data)


def createcalendar(request):
    Profile = apps.get_model('accounts', 'Profile')
    if request.method == 'POST':
        group_select_id = request.POST.get('student-group')
        group_select = Student_Group.objects.get(pk=group_select_id)
        day = request.POST.get('day')
        start_time = request.POST.get('start_time')
        end_time = request.POST.get('end_time')
        users_impleds = request.POST.getlist('users_impled')
        note = request.POST.get('note')
        calenadarnew = Calendar_Group(
            day=day,
            start_time=datetime.strptime(start_time, '%H:%M').time(),
            end_time=datetime.strptime(end_time, '%H:%M').time(),
            group_impl= group_select.group,
            note=note
        )
        if check_dup_calendar(calenadarnew)==False:
            calenadarnew.save()
            for user_id in users_impleds:
                users_impled = Profile.objects.get(pk=user_id)
                calenadarnew.users_impled.add(users_impled)
            calenadarnew.save()
            messages.success(request,"Đã thêm lịch học thành công")
        else:
            messages.error(request, "Thời gian học trùng với lịch học của nhóm")
    day = request.GET.get('month', None)
    if day == None:
        d = datetime.today()
    else:
        split_day = day.split('-')
        d = date(year=int(split_day[0]), month=int(split_day[1]), day=1)

    authen = False
    path = request.path
    try:
        profile_user = Profile.objects.get(user = request.user)
    except:
        profile_user = None
    if profile_user!=None and profile_user.role>=2:
        authen = True
    cal = Calendar(year=d.year, month=d.month, authentication=authen)
    html_calendar = cal.formatmonth(withyear=True)
    html_calendar = html_calendar.replace('<td ', '<td  width="150" height="150"')

    # list group of courses
    studentgroup = Student_Group.objects.all()

    content = {
        'header': "Lịch dạy",
        'calendar': mark_safe(html_calendar),
        'studentgroup': studentgroup,
    }

    return render(request, 'giasu/calendar.html', content)
