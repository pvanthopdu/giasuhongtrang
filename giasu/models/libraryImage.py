from django.db import models

class LibraryImage(models.Model):
    title = models.CharField(max_length=50, verbose_name="Tiên đề")
    image = models.ImageField(upload_to='libraryImage/', verbose_name='Hình ảnh')

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = "Thư viện ảnh"