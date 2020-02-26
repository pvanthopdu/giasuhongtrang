from django.core.validators import RegexValidator
from django.db import models
from .courses import Course

class Register_Course_Temp(models.Model):
    name_register = models.CharField(max_length=50, verbose_name='Tên người đăng ký')
    phone_register = models.CharField(max_length=10,
                                      verbose_name='Số điện thoại',
                                      validators=[
                                          RegexValidator(
                                              regex= '^0[0-9]{9}$',
                                              message='Nhập số điện thoại hợp lệ',
                                          )
                                      ])
    course_register = models.ForeignKey(Course, on_delete=models.SET_NULL,
                                       related_name='course_register_temp', null=True,
                                        verbose_name='Khóa học đăng ký')
    msg_register = models.TextField(max_length=100, verbose_name='Tin nhắn')
    status_register = models.BooleanField(default=False)

    def __str__(self):
        return self.name_register

    class Meta:
        verbose_name='Đăng ký tham gia khóa học của Anonymous User'

