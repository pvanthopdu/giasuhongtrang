from django.db import models


class Category(models.Model):
    cate_name = models.CharField(max_length=50, help_text="Category of courses")
    cate_description = models.TextField(max_length=100, default="Description")
    cate_image = models.ImageField(upload_to='category/', blank=True, null= True)
    def __str__(self):
        return self.cate_name