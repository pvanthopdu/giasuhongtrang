from django.contrib.auth.models import User
from django.db import models

from .quiz_lesson import Quiz_lesson


class Quiz_Score_Lesson(models.Model):

    quiz_lesson = models.ForeignKey(Quiz_lesson, on_delete=models.CASCADE,
                                     related_name='quiz_score',
                                     verbose_name="Bài thi")
    user_score = models.ForeignKey(User, on_delete=models.CASCADE,
                                   related_name='user_score',
                                   verbose_name="Thí sinh")
    mark = models.IntegerField(default=0)
    number_of_times = models.IntegerField(default=0)

    class Meta:
        unique_together = ('quiz_lesson', 'user_score')

    def __str__(self):
        return self.quiz_lesson.lesson_quiz.lesson_name