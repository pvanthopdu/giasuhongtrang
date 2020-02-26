from django.db import models
from ..models import Practice
from ckeditor_uploader.fields import RichTextUploadingField

class DoPractice(models.Model):
    user = models.ForeignKey('accounts.Profile', verbose_name="Học sinh",
                             on_delete=models.CASCADE)
    practice = models.ForeignKey(Practice, verbose_name="Bài tập",
                                 on_delete=models.CASCADE)
    answer = RichTextUploadingField(config_name='answer')

    def __str__(self):
        return self.practice.pratice_name

    class Meta:
        unique_together= ('user', 'practice')