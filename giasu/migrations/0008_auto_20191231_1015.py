# Generated by Django 2.2.6 on 2019-12-31 03:15

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('giasu', '0007_auto_20191227_0955'),
    ]

    operations = [
        migrations.AlterField(
            model_name='calendar_group',
            name='day',
            field=models.DateField(default=datetime.datetime(2019, 12, 31, 10, 15, 27, 430971), verbose_name='Ngày học'),
        ),
    ]
