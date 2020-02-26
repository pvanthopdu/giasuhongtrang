from django.db import models
from .lessons import Lesson
from django.contrib.auth.models import User
from ckeditor_uploader.fields import RichTextUploadingField
class Comment_lesson(models.Model):
    comment_lesson = models.ForeignKey(Lesson, on_delete=models.CASCADE,
                                        related_name='comments')
    comment_name = models.CharField(max_length=50)
    comment_detail = RichTextUploadingField()
    comment_parent = models.IntegerField(default=0)

    comment_user = models.ForeignKey(User, on_delete=models.CASCADE)

    def __str__(self):
        return self.comment_name