from django.contrib.auth.models import User
from django.db import models
from .lessons import Lesson
from .questions import Questions


class Quiz_lesson(models.Model):
    lesson_quiz = models.ForeignKey(Lesson, on_delete=models.CASCADE,
                                     related_name='lesson_quiz',
                                     verbose_name="Bài học")
    description_quiz = models.TextField(verbose_name="Mô tả bài kiểm tra");
    status_quiz = models.BooleanField(default=False, verbose_name="Trạng thái bài kiểm tra")
    question_quiz = models.ManyToManyField(Questions, related_name='quest_quiz',
                                           verbose_name="Câu hỏi")
    user_quiz = models.ManyToManyField(User, related_name='user_quiz',
                                           verbose_name="Danh sách học sinh thi")
    count_quiz = models.IntegerField(blank=False, null=False,
                                     verbose_name="Số lượng câu hỏi")
    time_quiz = models.IntegerField(blank=False, null=False,
                                    verbose_name="Thời gian kiểm tra")
    times_quiz = models.IntegerField(blank=False, null=False,
                                     verbose_name="Số lượt làm bài")

    class Meta:
        verbose_name = "Bài đánh giá kết thúc bài học"
    def __str__(self):
        return self.lesson_quiz.lesson_name