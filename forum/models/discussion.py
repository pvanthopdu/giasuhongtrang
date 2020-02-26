from django.db import models
from .question import Question
from ckeditor_uploader.fields import RichTextUploadingField


class Discussion(models.Model):
    question = models.ForeignKey(Question, verbose_name="Câu hỏi thảo luận",
                                 on_delete=models.CASCADE, related_name="discuss")
    dis_content = RichTextUploadingField(verbose_name="Nội dung thảo luận")
    image = models.ImageField(upload_to='forum/',
                              verbose_name="Hình ảnh", null=True, blank=True)
    curiculum = models.FileField(verbose_name="File đính kèm", upload_to='forum/',
                                 blank=True, null=True)
    dis_super = models.ForeignKey('Discussion', null=True, blank=True, on_delete=models.CASCADE,
                                  verbose_name="Thảo luận cha")
    dis_user = models.ForeignKey('accounts.Profile', verbose_name="Thảo luận bởi",
                             on_delete=models.SET_NULL, blank=True, null=True)
    time = models.DateTimeField(auto_now_add=True, verbose_name="Thời gian gởi thảo luận")
    view = models.IntegerField(default=0, verbose_name="Số lượt xem")
    like = models.IntegerField(default=0, verbose_name="Số lượt thích")

    def __str__(self):
        return self.dis_content[:50]
