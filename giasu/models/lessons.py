from django.apps import apps
from django.db import models
from .courses import Course
from ckeditor_uploader.fields import RichTextUploadingField


class Lesson(models.Model):
    lesson_name = models.CharField(max_length=50, verbose_name="Name of lesson")
    lesson_recap = models.TextField(verbose_name="Content recap of lesson")
    lesson_target = models.TextField(verbose_name="Target of lesson")
    lesson_detail = RichTextUploadingField(verbose_name="Content detail of lesson")
    lesson_image = models.ImageField(verbose_name="Image of course",
                                      upload_to='courses/', blank=True, null=True)
    lesson_doc = models.FileField(verbose_name="Curriculum doc",
                                   blank=True, null=True)
    lesson_video = models.URLField(verbose_name="Curriculum video",
                                    blank=True, null=True)
    lesson_status = models.BooleanField(verbose_name="Status of the lesson",
                                         default=False, help_text="Status of the lesson: Active or disactive")
    lesson_order = models.IntegerField(verbose_name="Order of lesson", default=1)
    lesson_course = models.ForeignKey(Course, verbose_name="Course",
                                       on_delete=models.CASCADE, related_name='lessons')

    class Meta:
        ordering = ('lesson_order',)
    def __str__(self):
        return self.lesson_name

    def save(self, *args, **kwargs):
        super().save(*args, **kwargs)
        if self.lesson_status == True:
            from .review_lesson import Review_lesson
            is_review_lesson = Review_lesson.objects.filter(lesson= self).exists()
            if not is_review_lesson:
                review_lesson = Review_lesson(lesson = self)
                review_lesson.save()

    @property
    def count_topic(self):
        Question = apps.get_model('forum', 'Question')
        return Question.objects.filter(topic=self).count()