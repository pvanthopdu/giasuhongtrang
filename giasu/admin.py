from .custom_calendar import CustomHTMLCal
import calendar
import datetime

from django.contrib import admin
from django.contrib.auth.models import Group
from django.http import HttpResponseRedirect
from django.utils.html import format_html
from django.urls import path, reverse
from django.utils.safestring import mark_safe

from .models import *

admin.site.site_header = "Gia su Hồng Trang"
# Register your models here.
admin.site.register(CarouselSlide)
admin.site.register(Category)
admin.site.register(Course)
admin.site.register(Lesson)
admin.site.register(Practice)
admin.site.register(DoPractice)
admin.site.register(Answer)
admin.site.register(Questions)

admin.site.register(Review_lesson)
admin.site.register(Review_course)

admin.site.register(Quiz_lesson)
admin.site.register(Quiz_lesson_User_do)
admin.site.register(Quiz_Score_Lesson)
admin.site.register(LibraryImage)

@admin.register(Register_Course_Temp)
class Course_Register_Temp_Admin(admin.ModelAdmin):
    list_display = ('name_register',
                    'phone_register',
                    'course_register',
                    'msg_register',
                    'action_html')

    # get url
    def get_urls(self):
        urls = super().get_urls()
        custom_urls = [
            path('register/<int:register_id>',
                 self.admin_site.admin_view(self.process_active),
                 name='active_register'),
        ]
        return custom_urls + urls

    # button action
    def action_html(self, obj):
        button_html = ''
        if obj.status_register == True:
            return format_html('Đăng ký đã duyệt')
        else:
            return format_html('<a class="button" href="{}">Duyệt</a>',
                               reverse('admin:active_register', args=[obj.pk]))

    action_html.short_description = 'Action'
    action_html.allow_tags = True

    def process_active(self, request, register_id, *args, **kwargs):

        # get object
        register_course = self.get_object(request, register_id)
        register_course.status_register = True
        register_course.save()
        self.message_user(request, "Duyệt đăng ký khóa học cho SĐT: "
                          + register_course.phone_register + " thành công")

        return HttpResponseRedirect('/admin/giasu/register_course_temp/')


@admin.register(Contact)
class Contact_Admin(admin.ModelAdmin):
    list_display = ('name_contact',
                    'phone_contact',
                    'email_contact',
                    'msg_contact',
                    'action_html')

    # get url
    def get_urls(self):
        urls = super().get_urls()
        custom_urls = [
            path('contact/<int:contact_id>',
                 self.admin_site.admin_view(self.process_active),
                 name='active_contact'),
        ]
        return custom_urls + urls

    # button action
    def action_html(self, obj):
        button_html = ''
        if obj.status_contact == True:
            return format_html('Liên hệ đã duyệt')
        else:
            return format_html('<a class="button" href="{}">Duyệt</a>',
                               reverse('admin:active_contact', args=[obj.pk]))

    action_html.short_description = 'Action'
    action_html.allow_tags = True

    def process_active(self, request, contact_id, *args, **kwargs):

        # get object
        contact = self.get_object(request, contact_id)
        contact.status_contact = True
        contact.save()
        self.message_user(request, contact.name_contact + " đã được duyệt")

        return HttpResponseRedirect('/admin/giasu/contact/')


@admin.register(Register_course)
class Register_course_Admin(admin.ModelAdmin):
    list_display = ('user_register',
                    'course_register',
                    'action_html')

    # get url
    def get_urls(self):
        urls = super().get_urls()
        custom_urls = [
            path('users/user_register_course/<int:register_id>',
                 self.admin_site.admin_view(self.process_active),
                 name='active_user_register_course'),
        ]
        return custom_urls + urls

    # button action
    def action_html(self, obj):
        if obj.status == True:
            return format_html('Đăng ký đã duyệt')
        else:
            return format_html('<a class="button" href="{}">Duyệt</a>',
                               reverse('admin:active_user_register_course', args=[obj.pk]))

    action_html.short_description = 'Action'
    action_html.allow_tags = True

    def process_active(self, request, register_id, *args, **kwargs):

        # get object
        register = self.get_object(request, register_id)
        register.status = True
        course_register = register.course_register
        course_register.course_students.add(register.user_register)
        register.save()
        course_register.save()

        self.message_user(request, "Duyệt đăng ký khóa học "
                          + course_register.course_name + " cho " +
                          register.user_register.user.username + " thành công.")

        return HttpResponseRedirect('/admin/giasu/register_course/')


# Administrator Group user
class Student_groupInline(admin.StackedInline):
    model = Student_Group
    can_delete = False
    verbose_name_plural = 'Student groups'
    fk_name = 'group'


class Calendar_groupTarbuline(admin.TabularInline):
    model = Calendar_Group
    can_delete = True
    verbose_name_plural = 'Lịch học của nhóm'
    fk_name = 'group_impl'
    extra = 0
    ordering = ['day', 'start_time', 'end_time']

class Custom_group_Admin(admin.ModelAdmin):
    inlines = (Student_groupInline, Calendar_groupTarbuline)

    # The save_formset method is given the HttpRequest
    def save_formset(self, request, form, formset, change):
        instances = formset.save(commit=False)
        for instance in instances:
            instance.save()
        formset.save_m2m()


admin.site.unregister(Group)
admin.site.register(Group, Custom_group_Admin)


# schedule for group
@admin.register(Calendar_Group)
class Calendar_Group_Admin(admin.ModelAdmin):
    class Media:
        css = {"all": ("styles/bootstrap4/bootstrap.min.css",
                       "plugins/fontawesome-5.9/css/all.css",
                       "styles/calendar_group.css",)}

    list_display = ['day', 'start_time', 'end_time', 'group_impl']
    change_list_template = 'admin/calendar_group/change_list.html'

    def changelist_view(self, request, extra_context=None):
        after_day = request.GET.get('day__gte', None)
        extra_context = extra_context or {}

        if not after_day:
            d = datetime.date.today()
        else:
            try:
                split_after_day = after_day.split('-')
                d = datetime.date(year=int(split_after_day[0]), month=int(split_after_day[1]), day=1)
            except:
                d = datetime.date.today()

        previous_month = datetime.date(year=d.year, month=d.month, day=1)  # find first day of current month
        previous_month = previous_month - datetime.timedelta(days=1)  # backs up a single day
        previous_month = datetime.date(year=previous_month.year, month=previous_month.month,
                                       day=1)  # find first day of previous month

        last_day = calendar.monthrange(d.year, d.month)
        next_month = datetime.date(year=d.year, month=d.month, day=last_day[1])  # find last day of current month
        next_month = next_month + datetime.timedelta(days=1)  # forward a single day
        next_month = datetime.date(year=next_month.year, month=next_month.month,
                                   day=1)  # find first day of next month

        extra_context['previous_month'] = reverse('admin:giasu_calendar_group_changelist') + '?day__gte=' + str(
            previous_month)
        extra_context['next_month'] = reverse('admin:giasu_calendar_group_changelist') + '?day__gte=' + str(next_month)

        cal = CustomHTMLCal()
        html_calendar = cal.formatmonth(d.year, d.month, withyear=True)
        html_calendar = html_calendar.replace('<td ', '<td  width="150" height="150"')
        extra_context['calendar'] = mark_safe(html_calendar)
        return super(Calendar_Group_Admin, self).changelist_view(request, extra_context)
