from django.db import models
from ckeditor_uploader.fields import RichTextUploadingField


class Question(models.Model):
    topic = models.ForeignKey('giasu.Lesson', verbose_name="Chủ đề", on_delete=models.CASCADE)
    content = RichTextUploadingField(verbose_name="Nội dung câu hỏi", blank=False, null=False)
    status = models.BooleanField(default=False, verbose_name="Trạng thái",
                                 help_text="Trạng thái câu hỏi")
    time = models.DateTimeField(auto_now_add=True, verbose_name="Thời gian gởi câu hỏi")
    user = models.ForeignKey('accounts.Profile', verbose_name="Tạo bởi",
                             on_delete=models.SET_NULL, blank=True, null=True)
    view = models.IntegerField(default=0, verbose_name="Số lượt xem")
    like = models.IntegerField(default=0, verbose_name="Số lượt thích")

    def __str__(self):
        return self.content[:50]

    @property
    def count_discus(self):
        from .discussion import Discussion
        return Discussion.objects.filter(question= self).count()

