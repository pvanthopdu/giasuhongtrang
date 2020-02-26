from django.db import models
from ckeditor_uploader.fields import RichTextUploadingField
class Answer(models.Model):
    answer = RichTextUploadingField()
    weight = models.IntegerField(default=1)

    def __str__(self):
        return self.answer