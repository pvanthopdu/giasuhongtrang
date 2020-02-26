from django.core.exceptions import ValidationError
from django.db import models
from datetime import datetime
from django.contrib.auth.models import Group
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.urls import reverse
from .student_group import Student_Group


class Calendar_Group(models.Model):
    day = models.DateField(default=datetime.now(), verbose_name="Ngày học")
    start_time = models.TimeField(verbose_name="Thời gian bắt đầu")
    end_time = models.TimeField(verbose_name="Thời gian kết thúc")
    group_impl = models.ForeignKey(Group, verbose_name="Nhóm thực hiện",
                                   on_delete=models.CASCADE, related_name="groups")
    users_impled = models.ManyToManyField('accounts.Profile',
                                          verbose_name="Học sinh đã tham gia",
                                          null=True, blank=True)
    note = models.TextField(max_length=50, verbose_name="Ghi chú", null=True, blank=True)

    def __str__(self):
        return str(self.day) + ":" + self.group_impl.name

    @property
    def count_users_impled(self):
        return self.users_impled.count()

    class Meta:
        verbose_name = "Lịch học nhóm"
        verbose_name_plural = "Lịch học nhóm"


    def check_duplicate(self, schedule):
        if (self.start_time >= schedule.start_time and self.end_time <= schedule.end_time) \
                or (self.start_time >= schedule.start_time and self.start_time < schedule.end_time) \
                or (self.end_time > schedule.start_time and self.end_time <= schedule.end_time):
            return True
        else:
            return False

    def clean(self):
        if self._state.adding == True:
            schedules = Calendar_Group.objects.filter(day=self.day, group_impl=self.group_impl)
        else:
            schedules = Calendar_Group.objects.filter(day=self.day, group_impl=self.group_impl).exclude(pk=self.id)

        if self.start_time >= self.end_time:
            raise ValidationError("Thời gian kết thúc phải sau thời gian bắt đầu")
        else:

            if schedules.exists():
                for schedule in schedules:
                    if self.check_duplicate(schedule):
                        raise ValidationError("Đã có lịch dạy trong thời gian này")

    def get_absolute_url(self):
        url = reverse('admin:%s_%s_change' % (self._meta.app_label, self._meta.model_name), args=[self.id])
        return u'<a href="%s">- %s->%s:%s</a>' % (url, self.start_time.strftime("%H:%M"),
                                                self.end_time.strftime("%H:%M"),self.group_impl.student_group)

    def get_absolute_urlfrontend(self):
        custom_group = Student_Group.objects.get(group=self.group_impl)
        url = reverse('giasu:manager-group-course', args=[custom_group.id])
        return u'<a href="%s">- %s->%s:%s</a>' % (url+'?next=/course/calendar', self.start_time.strftime("%H:%M"),
                                                self.end_time.strftime("%H:%M"),self.group_impl.student_group)


