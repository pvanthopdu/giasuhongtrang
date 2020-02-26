from django.contrib.auth.models import User
from django.db import models
from ..models import Course

class Register_course(models.Model):
    user_register = models.ForeignKey('accounts.Profile', on_delete=models.CASCADE,
                                        related_name='user_register',
                                      verbose_name="Người đăng ký")
    course_register = models.ForeignKey(Course, on_delete=models.CASCADE,
                                        related_name='course_register',
                                        verbose_name="Chọn khóa học")
    status = models.BooleanField(default=False, verbose_name="Trạng thái (đăng ký kích hoạt hoặc chưa kích hoạt)")

    class Meta:
        unique_together = ('user_register', 'course_register')

    def __str__(self):
        return self.user_register.user.username +"-"+self.course_register.course_name

    class Meta:
        verbose_name = 'Đăng ký tham gia khóa học của Authenticated User'