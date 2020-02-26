from django.db import models
from django.contrib.auth.models import Group
from ..models import Course

class Student_Group_Manager(models.Manager):
    def count_group(self):
        return self.all().count()

class Student_Group(models.Model):
    group = models.OneToOneField(Group, unique= True, on_delete=models.CASCADE,
                                 verbose_name="Nhóm sinh viên")
    created_by = models.ForeignKey('accounts.Profile', verbose_name="Người quản lý nhóm",
                                   on_delete= models.CASCADE, related_name='teacher_group')
    date_created = models.DateTimeField(auto_now_add=True, verbose_name="Ngày tạo")
    belong_course = models.ForeignKey(Course, verbose_name='Khóa học',
                                      on_delete=models.CASCADE)
    member = models.ManyToManyField('accounts.Profile', verbose_name="Thành viên nhóm",
                                    null=True, blank=True)
    objects = Student_Group_Manager()

    def __str__(self):
        return self.group.name+"-"+self.belong_course.course_name

    @property
    def count_member(self):
        return self.member.count()