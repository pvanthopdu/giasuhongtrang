from django.db import models
from .lessons import Lesson

class Review_lesson(models.Model):
    lesson = models.OneToOneField(Lesson,on_delete=models.CASCADE,
                                   verbose_name="Lesson",
                                   primary_key=True)
    star1 = models.IntegerField(default=0)
    star2 = models.IntegerField(default=0)
    star3 = models.IntegerField(default=0)
    star4 = models.IntegerField(default=0)
    star5 = models.IntegerField(default=0)

    def __str__(self):
        return self.lesson.lesson_name
    class Meta:
        verbose_name = 'Đánh giá bài học *****'