from django.db import models
from  datetime import date

# Create your models here.
class CarouselSlide(models.Model):
    title = models.CharField(max_length=50, blank=True)
    description = models.TextField(max_length=100, default="Description")
    image = models.ImageField(upload_to='carousel/')
    date_published = models.DateField(default=date.today)
    pathURL = models.URLField(null= True, blank= True)
    def __str__(self):
        return self.title + "-" + str(self.date_published)