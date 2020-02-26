from django.core.validators import RegexValidator
from django.db import models

class Contact(models.Model):
    name_contact = models.CharField(max_length=50, verbose_name="Họ và tên")
    phone_contact = models.CharField(max_length=10,
                                      verbose_name='Số điện thoại',
                                      validators=[
                                          RegexValidator(
                                              regex='^0[0-9]{9}$',
                                              message='Nhập số điện thoại hợp lệ',
                                          )
                                      ])
    email_contact = models.CharField(max_length=50, verbose_name="Địa chỉ email")
    msg_contact = models.TextField(max_length=100, verbose_name="Nội dung liên hệ")
    status_contact = models.BooleanField(default=False)

    def __str__(self):
        return self.name_contact

    class Meta:
        verbose_name='Liên hệ'