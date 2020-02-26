from django.apps import apps
from django.db import models
from .category import Category
from ckeditor_uploader.fields import RichTextUploadingField

class Course(models.Model):
    # profileUser = apps.get_model('accounts', 'Profile')
    course_name = models.CharField(max_length=50,
                                   verbose_name="Name of course", unique=True)
    course_description = RichTextUploadingField(verbose_name="Description of course")
    course_target = models.TextField(verbose_name="Target of course")
    course_require = models.TextField(verbose_name="Requirements of course",
                                      null=True, blank=True)
    course_image = models.ImageField(upload_to='courses/',
                                     verbose_name="Image of course",
                                     null=True, default='courses/default.jpg',
                                     help_text="Choice image for course. If you don't choice for "
                                               "course, web will get image 'default'")
    course_duration = models.CharField(max_length=50, verbose_name="Duration of course")
    course_status = models.BooleanField(verbose_name="Status of course",
                                        help_text="Check get active this course")
    course_price = models.IntegerField(verbose_name="Price of course",default=0)
    course_cate = models.ForeignKey(Category, on_delete=models.CASCADE,
                                    related_name='courses',
                                    verbose_name="Category of course")
    course_teachers = models.ManyToManyField('accounts.Profile',related_name='teachers',
                                             verbose_name="Teachers of course")
    course_students = models.ManyToManyField('accounts.Profile', blank=True,
                                             related_name='students',
                                             verbose_name="Students of course")

    def __str__(self):
        return self.course_name

    def save(self, *args, **kwargs):
        super().save(*args, **kwargs)
        if self.course_status == True:
            from .review_course import Review_course
            is_review_course = Review_course.objects.filter(course=self).exists()
            if not is_review_course:
                review_course = Review_course(course= self)
                review_course.save()

    @property
    def count_group(self):
        from .student_group import Student_Group
        return Student_Group.objects.filter(belong_course=self).count()

    @property
    def count_lesson(self):
        from .lessons import Lesson
        return Lesson.objects.filter(lesson_course=self).count()
