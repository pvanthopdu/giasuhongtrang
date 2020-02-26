from django.db import models
from .answer import Answer
from .lessons import Lesson
from ckeditor_uploader.fields import RichTextUploadingField

class Questions(models.Model):
    question = RichTextUploadingField()
    answers = models.ManyToManyField(Answer)
    correct_answer = models.ForeignKey(Answer, on_delete=models.SET_NULL,
                                       related_name='correct_answer', null=True)

    ques_lesson = models.ForeignKey(Lesson, on_delete=models.SET_NULL,
                                     verbose_name="Question of lesson",
                                       related_name='question_lesson', null=True)
    feedback = RichTextUploadingField(null=True, blank=True)

    def __str__(self):
        return self.question[:20]