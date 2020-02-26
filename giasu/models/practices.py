from django.db import models
from .lessons import Lesson
from ckeditor_uploader.fields import RichTextUploadingField

class Practice(models.Model):
    pratice_lesson = models.ForeignKey(Lesson, on_delete=models.CASCADE,
                                       related_name='practices')
    pratice_name = models.CharField(max_length=50, help_text="name of practice")
    practice_detail = RichTextUploadingField()
    pratice_answer = RichTextUploadingField()

    def __str__(self):
        return self.pratice_name