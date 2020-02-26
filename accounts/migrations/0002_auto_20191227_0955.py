# Generated by Django 2.2.6 on 2019-12-27 02:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='profile',
            name='role',
            field=models.PositiveSmallIntegerField(blank=True, choices=[(1, 'Student'), (2, 'Teacher'), (3, 'Supervisor')], default=1, null=True),
        ),
    ]
