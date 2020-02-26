from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver

# Create your models here.
class Major(models.Model):
    name_major = models.CharField(max_length=50, verbose_name="Ngành nghề")
    def __str__(self):
        return self.name_major

class Profile(models.Model):
    STUDENT = 1
    TEACHER = 2
    SUPERVISOR = 3
    ROLE_CHOICES = (
        (STUDENT, 'Student'),
        (TEACHER, 'Teacher'),
        (SUPERVISOR, 'Supervisor'),
    )
    SEX_CHOICES = (('Mr','Mr'), ('Mrs','Mrs'), ('Miss','Miss'))

    user = models.OneToOneField(User, on_delete=models.CASCADE)
    infor = models.TextField(verbose_name='Information about yourself')
    birthdate = models.DateField(null=True, blank=True)
    gender = models.TextField(choices=SEX_CHOICES)
    image = models.ImageField(upload_to='profile/',
                              null=True, default='profile/default.jpg')
    location = models.CharField(max_length=30, blank=True)
    role = models.PositiveSmallIntegerField(choices=ROLE_CHOICES, null=True, blank=True, default=STUDENT)
    major = models.ForeignKey(Major, on_delete=models.SET_NULL, related_name="major",
                              verbose_name="Chuyên môn", null=True)
    point = models.IntegerField(default=0, verbose_name="Point")

    def __str__(self):  # __unicode__ for Python 2
        return self.get_full_name

    @receiver(post_save, sender=User)
    def create_user_profile(sender, instance, created, **kwargs):
        if created:
            Profile.objects.create(user=instance)

    @receiver(post_save, sender=User)
    def save_user_profile(sender, instance, **kwargs):
        instance.profile.save()

    @property
    def get_full_name(self):
        return self.gender+". "+ self.user.first_name + " " + self.user.last_name


