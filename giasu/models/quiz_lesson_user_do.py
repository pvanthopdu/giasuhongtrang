from django.db import models
from django.contrib.auth.models import User
from .quiz_lesson import Quiz_lesson
from .questions import Questions
from ckeditor_uploader.fields import RichTextUploadingField

class Quiz_lesson_User_do(models.Model):
    lesson_quiz = models.ForeignKey(Quiz_lesson,on_delete=models.CASCADE,
                                        related_name='lesson_quiz_do',
                                      verbose_name="Bài thi")
    user_quiz = models.ForeignKey(User, on_delete=models.CASCADE,
                                        related_name='user_quiz_do',
                                      verbose_name="Người thi")
    question_quiz = models.ForeignKey(Questions, on_delete=models.CASCADE,
                                        related_name='question_quiz_do',
                                      verbose_name="Câu hỏi")

    answer_quiz = RichTextUploadingField()
    

    class Meta:
        unique_together = ('lesson_quiz', 'user_quiz', 'question_quiz')

    def __str__(self):
        return self.user_quiz.username+"-"+self.question_quiz.question[:20]