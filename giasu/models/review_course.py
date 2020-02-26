from django.db import models
from .courses import Course

class Review_course(models.Model):
    course = models.OneToOneField(Course,on_delete=models.CASCADE,
                                   verbose_name="courses",
                                   primary_key=True)
    star1 = models.IntegerField(default=0)
    star2 = models.IntegerField(default=0)
    star3 = models.IntegerField(default=0)
    star4 = models.IntegerField(default=0)
    star5 = models.IntegerField(default=0)

    @property
    def get_average_star(self):
        average = self.star1 + self.star2 + self.star3 + self.star4 + self.star5
        return round(float(average)/5, 1)

    def __str__(self):
        return self.course.course_name
    class Meta:
        verbose_name = 'Đánh giá khóa học *****'